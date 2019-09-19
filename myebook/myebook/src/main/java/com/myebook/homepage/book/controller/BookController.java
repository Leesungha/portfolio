package com.myebook.homepage.book.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myebook.homepage.book.db.BookDTO;
import com.myebook.homepage.book.db.BooklikeDTO;
import com.myebook.homepage.book.db.CategoryDTO;
import com.myebook.homepage.book.db.OrderDTO;
import com.myebook.homepage.book.db.OrderListDTO;
import com.myebook.homepage.book.db.ReplyDTO;
import com.myebook.homepage.book.service.BookServiceImpl;
import com.myebook.homepage.member.db.MemberDTO;
import com.myebook.utils.UploadFileUtils;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/")
public class BookController {

	@Inject
	private BookServiceImpl service;

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 상품 관리 페이지 이동
	@RequestMapping(value = "getBook.do", method = RequestMethod.GET)
	public String getBook() throws Exception {
		return "writer/book_manage";
	}

	// 상품 등록 카테고리
	@RequestMapping(value = "register.do", method = RequestMethod.GET)
	public String register(Model model) throws Exception {

		System.out.println("상품 카테고리 등록!");
		List<CategoryDTO> category = null;
		category = service.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		System.out.println(category);
		return "writer/book/register";
	}

	// 상품등록
	@RequestMapping(value = "insert.do", method = RequestMethod.POST)
	public String insert(BookDTO book, MultipartFile file) throws Exception {

		System.out.println("????" + file);
		System.out.println("오십니까..");
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		System.out.println("이미지 업로드 패스" + imgUploadPath);
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		System.out.println("ymb 패스" + ymdPath);
		String fileName = null;

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			book.setGdsImg(File.separator + "myebook" + File.separator + "resources" + File.separator + "imgUpload"
					+ ymdPath + File.separator + fileName);
			System.out.println("파일 세파레이터" + File.separator);

			book.setThumbImg(File.separator + "myebook" + File.separator + "resources" + File.separator + "imgUpload"
					+ ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

			System.out.println("파일네임" + fileName);
		}

		else {
			fileName = "images" + File.separator + "none.jpg";
			book.setGdsImg(fileName);
			book.setThumbImg(fileName);
		}

		service.registerBook(book);

		return "writer/book_manage";
	}

	// 상품 목록
	@RequestMapping(value = "booklist.do", method = RequestMethod.GET)
	public String booklist(Model model) throws Exception {
		List<BookDTO> booklist = service.booklist();
		model.addAttribute("booklist", booklist);
		return "writer/book/list";
	}

	// 상품 조회
	@RequestMapping(value = "bookview.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String bookview(@RequestParam("bkid") int bkid, Model model) throws Exception {

		System.out.println("뷰로 들어오니??");
		BookDTO book = service.bookview(bkid);
		model.addAttribute("book", book);

		return "writer/book/view";
	}

	// 상품 조회 -> 수정 페이지 이동
	@RequestMapping(value = "bookmodify.do", method = RequestMethod.GET)
	public String bookmodify(@RequestParam("bkid") int bkid, Model model) throws Exception {
		System.out.println("뷰로 들어오니??");
		BookDTO mdbook = service.bookview(bkid);
		model.addAttribute("mdbook", mdbook);

		List<CategoryDTO> category = null;
		category = service.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		System.out.println(category);

		return "writer/book/modify";
	}

	// 상품 수정
	@RequestMapping(value = "updatebook.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String bookmodify(BookDTO book, @RequestParam("bkid") int bkid, Model model, MultipartFile file,
			HttpServletRequest req) throws Exception {

		// 새로운 파일이 등록되었는지 확인
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(uploadPath + req.getParameter("gdsImg")).delete();
			new File(uploadPath + req.getParameter("thumbImg")).delete();

			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);

			book.setGdsImg(File.separator + "myebook" + File.separator + "resources" + File.separator + "imgUpload"
					+ ymdPath + File.separator + fileName);
			book.setThumbImg(File.separator + "myebook" + File.separator + "resources" + File.separator + "imgUpload"
					+ ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 새로운 파일이 등록되지 않았다면 기존 이미지를 그대로 사용
			book.setGdsImg(req.getParameter("gdsImg"));
			book.setThumbImg(req.getParameter("thumbImg"));
		}

		service.bookmodify(book);

		return "redirect://booklist.do";
		// return "/bookview.do?bkid=\'"+bkid+"'+";

	}

	// 상품 삭제
	@RequestMapping(value = "bookdelete.do", method = RequestMethod.POST)
	public String bookdelete(@RequestParam("bkid") int bkid) throws Exception {

		service.bookdelete(bkid);

		return "redirect://booklist.do";

	}

	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "book/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res,
			@RequestParam MultipartFile upload) throws Exception {

		System.out.println("ck업로드~");

		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		try {

			String fileName = upload.getOriginalFilename(); // 파일 이름 가져오기
			byte[] bytes = upload.getBytes();

			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;

			System.out.println("ckUploadPath = " + ckUploadPath);

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush();// out에 저장된 데이터를 전송하고 초기화

			String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = "/myebook/resources/ckUpload/" + uid + "_" + fileName; // 작성화면

			System.out.println("callback = " + callback);
			System.out.println("fileUrl = " + fileUrl);

			// 업로드시 메시지 출력
			/*
			 * printWriter.println("<script type='text/javascript'>" +
			 * "window.parent.CKEDITOR.tools.callFunction(" + callback+",'"+
			 * fileUrl+"','이미지를 업로드하였습니다.')" +"</script>"); System.out.println(printWriter);
			 * printWriter.flush();
			 */

			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}

	// 주문 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String getOrderList(Model model) throws Exception {

		List<OrderDTO> orderList = service.orderList();

		model.addAttribute("orderList", orderList);
		return "writer/book/orderList";
	}

	// 주문 상세 목록
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public String getOrderList(@RequestParam("n") String orderId, OrderDTO order, Model model) throws Exception {
		order.setOdid(orderId);
		List<OrderListDTO> orderView = service.orderView(order);

		model.addAttribute("orderView", orderView);

		return "writer/book/orderView";
	}

	// 주문 상세 목록 - 배송 상태 변경
	@RequestMapping(value = "updateorder.do", method = RequestMethod.POST)
	public String delivery(OrderDTO order) throws Exception {

		service.delivery(order);

		List<OrderListDTO> orderView = service.orderView(order);

		BookDTO book = new BookDTO();

		for (OrderListDTO i : orderView) {
			book.setBkid(i.getBkid());
			book.setGdsStock(i.getCartStock());
			service.changeStock(book);
		}

		return "redirect:./orderList";
	}

	// 모든 소감(댓글)
	@RequestMapping(value = "/allReply.do", method = RequestMethod.GET)
	public String getAllReply(Model model) throws Exception {

		List<ReplyDTO> reply = service.allReply();

		model.addAttribute("reply", reply);

		return "writer/book/allreply";
	}

	// 소감 지우기
	@RequestMapping(value = "/deleteReply", method = RequestMethod.POST)
	public String deleteReply(@RequestParam("rid") int rid, ReplyDTO reply, HttpSession session) throws Exception {
		service.deleteReply(rid);

		return "redirect:/allReply.do";
	}
	//
	// @RequestMapping(value = "/read", method = RequestMethod.GET)
	// public void read(@RequestParam("bkid") int bkid, Model model,
	// @ModelAttribute("cri") SearchCriteria cri,
	// @ModelAttribute("category") String category,
	// HttpServletRequest httpRequest) throws Exception {
	//
	// int id = ((MemberDTO)
	// httpRequest.getSession().getAttribute("member")).getId();
	//
	// BooklikeDTO booklike = new BooklikeDTO();
	// booklike.setBkid(bkid);
	// booklike.setId(id);
	//
	// int boardlike = service.getBoardLike(booklike);
	// System.out.println(boardlike);
	//
	// model.addAttribute("heart",boardlike);
	// }

	// @ResponseBody
	// @RequestMapping(value = "/heart", method = RequestMethod.POST, produces =
	// "application/json")
	// public int heart(HttpServletRequest httpRequest) throws Exception {
	//
	// int heart = Integer.parseInt(httpRequest.getParameter("heart"));
	// int bkid = Integer.parseInt(httpRequest.getParameter("bkid"));
	// int id = ((MemberDTO)
	// httpRequest.getSession().getAttribute("member")).getId();
	//
	// BooklikeDTO booklike = new BooklikeDTO();
	//
	// booklike.setBkid(bkid);
	// booklike.setId(id);
	//
	// System.out.println(heart);
	//
	// if(heart >= 1) {
	// service.deleteBoardLike(booklike);
	// heart=0;
	// } else {
	// service.insertBoardLike(booklike);
	// heart=1;
	// }
	//
	// return heart;
	//
	// }

}
