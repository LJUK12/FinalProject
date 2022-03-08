package com.project.finalProject.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.finalProject.model.BoardVO;
import com.project.finalProject.model.ComChatMemberVO2;
import com.project.finalProject.model.ComChatVO;
import com.project.finalProject.model.Criteria;
import com.project.finalProject.model.PageMakerDTO;
import com.project.finalProject.model.PhotoVo;
import com.project.finalProject.service.ChatService;
import com.project.finalProject.service.IBoardService;
import com.project.finalProject.service.MemberService;

@RequestMapping("/board/*")
@Controller
public class BoardController {

	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private IBoardService boardService;

	
	@Autowired
	ChatService chatService;

	@Autowired
	MemberService memService;

	/* 게시판 목록 페이지 접속(페이징 적용) */
	@GetMapping("/list")
	public String boardListGET(Model model, Criteria cri) {

		model.addAttribute("list", boardService.getListPaging(cri));
		int total = boardService.getTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("board", boardService.getList());
		model.addAttribute("pageMaker", pageMake);

		return "/board/list";
	}

	@RequestMapping("/insertCommunityForm")
	public String insertPostForm() {
		return "/board/insertCommunityForm";
	}

	// 게시글 등록 스마트 버전
	@RequestMapping("/insertBoard")
	public String insertBoard(BoardVO vo) {

		System.out.println("content = " + vo.getComContent());

		//
		int startIdx = vo.getComContent().indexOf("/photo_upload/");

		if (startIdx != -1) {
			System.out.println("startIdx = " + startIdx);

			// +14 start

			boolean jpg = vo.getComContent().contains(".jpg");
			boolean png = vo.getComContent().contains(".png");
			boolean gif = vo.getComContent().contains(".gif");
			int endIdx = 0;
			if (jpg) {
				endIdx = vo.getComContent().indexOf(".jpg");
			} else if (png) {
				endIdx = vo.getComContent().indexOf(".png");
			} else if (gif) {
				endIdx = vo.getComContent().indexOf(".gif");
			}
			System.out.println("endIdx = " + endIdx);

			// + 4 end

			String thumbFileName = vo.getComContent().substring((startIdx + 14), (endIdx + 4));
			System.out.println("thumbFileName = " + thumbFileName);

			// 포스트 썸네일 set
			vo.setComImg(thumbFileName);
		}
		// 포스트 내용의 \n을 <br>로 변경
		vo.setComContent(vo.getComContent().replace("\n", "<br>"));
		boardService.insertPost(vo);
		return "redirect:/";
	}

	// 게시글 작성 - 이미지
	@RequestMapping("/photoUpload")
	public String photoUpload(HttpServletRequest request, PhotoVo vo) {
		String callback = vo.getCallback();
		String callback_func = vo.getCallback_func();
		String file_result = "";
		try {
			if (vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null
					&& !vo.getFiledata().getOriginalFilename().equals("")) {

				String original_name = vo.getFiledata().getOriginalFilename();
				String ext = original_name.substring(original_name.lastIndexOf(".") + 1);
				String defaultPath = request.getSession().getServletContext().getRealPath("/");
				String path = defaultPath + "resource" + File.separator + "photo_upload" + File.separator;
				File file = new File(path);
				System.out.println("path:" + path);
				if (!file.exists()) {
					file.mkdirs();
				}
				String realname = UUID.randomUUID().toString() + "." + ext;
				vo.getFiledata().transferTo(new File(path + realname));
				file_result += "&bNewLine=true&sFileName=" + original_name + "&sFileURL=/resource/photo_upload/"
						+ realname;
			} else {
				file_result += "&errstr=error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:" + callback + "?callback_func=" + callback_func + file_result;
	}

	// detailViewPost 게시글 상세 보기
	@RequestMapping("/detailViewBoard/{comNo}")
	public String detailViewBoard(@PathVariable int comNo, Model model) {

		BoardVO board = boardService.detailViewBoard(comNo);
		model.addAttribute("board", board);

		ArrayList<ComChatMemberVO2> chatList = chatService.listAllChatCommunity(comNo);
		model.addAttribute("chatList", chatList);

		boardService.hitCount(comNo);
		return "board/detailViewBoard";
	}

	// 댓글달기
	@ResponseBody
	@RequestMapping("/insertChat2.do")
	public String insertChat2(ComChatVO vo) {
		String result = "success";
		chatService.insertChat2(vo);
		// model.addAttribute("chatVO",chatVO);
		return result;
	}

	// 페이지 시작시 memNo로 아이디 찾아오기
	@ResponseBody
	@RequestMapping("/searchMemid")
	public String searchMemid(@RequestParam("comNo") int comNo) {
		System.out.println(comNo);
		String result = memService.searchMemId(comNo);
		return result;
	}

	/* 수정 페이지 이동 */
	@RequestMapping("/modify/{comNo}")
	public String boardModifyGET(@PathVariable int comNo, Model model) {
		BoardVO boardVO = boardService.detailViewBoard(comNo);
		model.addAttribute("pageInfo", boardVO);
		return "/board/updateCommunityForm";
	}

	/* 페이지 수정 */
	@RequestMapping("/modify")
	public String boardModifyPOST(BoardVO board) {

		boardService.modify(board);

		return "redirect:/board/list";
	}

	/* 페이지 삭제 */
	@PostMapping("/delete")
	public String boardDeletePOST(int comNo, RedirectAttributes rabs) {

		boardService.delete(comNo);
		rabs.addFlashAttribute("result", "delete success");
		return "redirect:/board/list";
	}
	
	  //나의 게시글 목록
    @RequestMapping("/myBoardList")
    public String myBoardList(HttpSession session, Model model) {
    	int memNo = (int) session.getAttribute("No");
    	ArrayList<BoardVO> vo = boardService.getMyList(memNo);

    	model.addAttribute("bList",vo);
    	return "/board/myBoardList";
    }

}
