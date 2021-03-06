package com.project.finalProject.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.finalProject.model.ChatMemberVO2;
import com.project.finalProject.model.ChatVO;
import com.project.finalProject.model.FavoritVO;
import com.project.finalProject.model.PhotoVo;
import com.project.finalProject.model.PostVO;
import com.project.finalProject.service.ChatService;
import com.project.finalProject.service.FavoritService;
import com.project.finalProject.service.MemberService;
import com.project.finalProject.service.ObjectDetectionService;
import com.project.finalProject.service.PostService;
import com.project.finalProject.service.TestService;
import com.project.finalProject.service.TranslationService;

@Controller
public class PostController {
	
	@Autowired
	TestService testService;

	@Autowired
	PostService postService;

	@Autowired
	MemberService memService;

	@Autowired
	ChatService chatService;

	@Autowired
	private ObjectDetectionService objService;

	@Autowired
	private TranslationService tsService;

	@Autowired
	private FavoritService faService;

	@RequestMapping("/insertPostForm")
	public String insertPostForm() {
		return "/post/insertPostForm";
	}

	@RequestMapping("/post/insertPost")
	public String insertPost(PostVO vo) {

		System.out.println("content = " + vo.getPostContent());
		String thumbFileName = "default.jpg";
		//
		System.out.println(thumbFileName);
		int startIdx = vo.getPostContent().indexOf("/photo_upload/");

		if (startIdx != -1) {
			System.out.println("startIdx = " + startIdx);

			// +14 start

			boolean jpg = vo.getPostContent().contains(".jpg");
			boolean png = vo.getPostContent().contains(".png");
			boolean gif = vo.getPostContent().contains(".gif");
			int endIdx = 0;
			if (jpg) {
				endIdx = vo.getPostContent().indexOf(".jpg");
				thumbFileName = vo.getPostContent().substring((startIdx + 14), (endIdx + 4));
			} else if (png) {
				endIdx = vo.getPostContent().indexOf(".png");
				thumbFileName = vo.getPostContent().substring((startIdx + 14), (endIdx + 4));
			} else if (gif) {
				endIdx = vo.getPostContent().indexOf(".gif");
				thumbFileName = vo.getPostContent().substring((startIdx + 14), (endIdx + 4));
			}
			System.out.println(thumbFileName);

		}
		vo.setPostImg(thumbFileName);
		// ????????? ????????? \n??? <br>??? ??????
		vo.setPostContent(vo.getPostContent().replace("\n", "<br>"));
		postService.insertPost(vo);
		return "redirect:/";
	}

	// ????????? ?????? - ?????????

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

	// detailViewPost ?????? ???????????? ??????

	@RequestMapping("/post/detailViewPost/{postNo}")
	public String detailViewPost(ChatVO vo, @PathVariable int postNo, Model model, HttpSession session) {

		PostVO post = postService.detailVeiwPost(postNo);
		model.addAttribute("post", post);

		// ????????? ??????
		postService.posthitplus(postNo);

		// ???????????? ??????
		model.addAttribute("favoritPost", 0);
		if (session.getAttribute("No") != null) {
			int memNo = (int) session.getAttribute("No");
			HashMap<String, Object> list = new HashMap<String, Object>();
			list.put("memNo", memNo);
			list.put("postNo", postNo);
			if (faService.selectFavorit(list) != null) {
				model.addAttribute("favoritPost", 1);
			}

		}

		/* chatService.insertChat(vo); */

		ArrayList<ChatMemberVO2> chatList = chatService.listAllChat(postNo);
		model.addAttribute("chatList", chatList);

		ArrayList<PostVO> postList2 = postService.listAllPost();
		model.addAttribute("postList2", postList2);

		return "post/detailViewPost";
	}

	@RequestMapping("/searchPost")
	public String searchPost(@RequestParam("searchBarInput") String searchBarInput, Model model) {

		ArrayList<PostVO> postVO = postService.searchPost(searchBarInput);
		ArrayList<PostVO> titleCntPostVO = postService.titleContentSearchPost(searchBarInput);
		model.addAttribute("searchPostVO", postVO);
		model.addAttribute("resultStr", searchBarInput);
		model.addAttribute("titleCntPostVO", titleCntPostVO);

		return "post/searchPost";
	}

	@ResponseBody
	@RequestMapping("/insertChat.do")
	public String insertChat(ChatVO vo) {
		String result = "success";
		chatService.insertChat(vo);
		// model.addAttribute("chatVO",chatVO);
		return result;
	}

	@ResponseBody
	@RequestMapping("/favorit")
	public String Favoritcountplus(@RequestParam("postNo") int postNo) {
		String result = "success";
		postService.FavoritCountPlus(postNo);
		return result;
	}

	// ????????? ????????? memNo??? ????????? ????????????
	@ResponseBody
	@RequestMapping("/searchMemid")
	public String searchMemid(@RequestParam("postNo") int postNo) {
		String result = memService.searchMemId(postNo);
		return result;
	}
	
	// ????????? ????????? post??? Title ????????????
		@ResponseBody
		@RequestMapping("/searchTitle")
		public String searchTitle(@RequestParam("postNo") int postNo) {
			String result = postService.searchTitle(postNo);
			return result;
		}
	
	
	

	// ????????? ????????? memNo??? ????????? ????????????2
	@ResponseBody
	@RequestMapping("/searchMemid2")
	public String searchMemid2(@RequestParam("postNo") int postNo) {
		String result = memService.searchMemId2(postNo);
		return result;
	}

	@ResponseBody
	@RequestMapping("/declPost")
	public String declPost(@RequestParam("postNo") int postNo) {
		String result = "success";
		postService.declPlus(postNo);
		return result;
	}

	@ResponseBody
	@RequestMapping("/deletePost")
	public String deletePost(@RequestParam("postNo") int postNo, @RequestParam("memNo") int memNo) {
		PostVO vo = postService.listPost(postNo);
		System.out.println(vo);
		System.out.println(vo.getMemNo());
		String result = "fail";
		if (vo.getPostNo() == postNo) {
			if (vo.getMemNo() == memNo) {
				postService.deletePost(postNo);
				result = "success";
			}
		}
		System.out.println(result);
		return result;
	}

	@RequestMapping("/objectDetection")
	public String objectDetection(@RequestParam("uploadFile") MultipartFile file, Model model) {
		ArrayList<String> strList = null;
		System.out.println("objectDetection ????????????");
		String resultStr = "";
		try {
			// 1. ???????????? ???????????? ????????? ???????????? : ???????????? ??????????????????????????? ???????????? (????????????????????? ?????????????????? ????????????)
			String uploadPath = "/root/ai/";
			/* "D:/ai/"; */

			// 2. ???????????? ???????????? ???????????? ????????????????????????
			String originalFileName = file.getOriginalFilename();
			String filePathName = uploadPath + originalFileName;

			// 3. ???????????? ????????????
			File file1 = new File(filePathName);

			// 4. ??????????????? ????????????
			file.transferTo(file1);

			// ????????????????????? ???????????? path?????? ?????????????????? ???????????? -> ??????????????? ??????????????????????????? ????????????
			// ??????????????????????????? ??????????????? PoseVO ?????????????? ????????????
			strList = objService.objectDetect(filePathName);

			/*
			 * for(int i = 0; i<strList.size(); i++) { resultStr += strList.get(i) + " "; }
			 */
			resultStr = strList.get(0);
			System.out.println("Controller : " + resultStr);
			resultStr = tsService.papagoTranslate(resultStr);
			System.out.println("Controller papago  : " + resultStr);
			ArrayList<PostVO> postVO = postService.searchPost(resultStr);

			ArrayList<PostVO> titleCntPostVO = postService.titleContentSearchPost(resultStr);

			model.addAttribute("resultStr", resultStr);
			model.addAttribute("searchPostVO", postVO);
			model.addAttribute("titleCntPostVO", titleCntPostVO);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "post/searchPost";
	}

	@RequestMapping("/allContentSearchPost/{resultStr}")
	public String allContentSearchPost(@PathVariable String resultStr, Model model) {
		System.out.println("allSearch : " + resultStr);
		ArrayList<PostVO> postVO = postService.titleContentSearchPost(resultStr);
		model.addAttribute("searchPostVO", postVO);
		return "post/allSearchPost";
	}

	@RequestMapping("/allCateorySearchPost/{resultStr}")
	public String allCateorySearchPost(@PathVariable String resultStr, Model model) {
		ArrayList<PostVO> postVO = postService.searchPost(resultStr);
		model.addAttribute("searchPostVO", postVO);
		return "post/allSearchPost";
	}

	// ?????? ??? ??? ??????
	@RequestMapping("/myPostList/{page}")
	public String myPostList(HttpSession session, Model model, @PathVariable String page) {
		int memNo = (int) session.getAttribute("No");

		int spage = 1;
		if (page != null)
			spage = Integer.parseInt(page);

		HashMap<String, Object> myOpt = new HashMap<String, Object>();
		myOpt.put("memNo", memNo);
		myOpt.put("start", spage * 10 - 9);

		ArrayList<PostVO> postList = postService.myPost(myOpt);
		int listCount = postService.postListCount(memNo);

		// ?????? ????????? ???
		int maxPage = (int) (listCount / 10.0 + 0.9);
		// ?????? ????????? ??????
		int startPage = (int) (spage / 5.0 + 0.8) * 5 - 4;
		// ????????? ????????? ??????
		int endPage = startPage + 4;
		if (endPage > maxPage)
			endPage = maxPage;

		model.addAttribute("spage", spage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("postList", postList);

		return "/post/myPostList";
	}

	// ????????? ????????????

	@ResponseBody
	@RequestMapping("/favoritPost")
	public int favoritPost(@RequestParam HashMap<String, Object> list, HttpSession session) {
		int memNo = (int) session.getAttribute("No");
		String memId = (String) session.getAttribute("sid");
		System.out.println(list.get("favorit"));
		int favorit = Integer.parseInt(String.valueOf(list.get("favorit")));
		list.remove("favorit");
		list.put("memNo", memNo);
		FavoritVO vo = faService.selectFavorit(list);
		System.out.println("in");

		if (memId != null) {
			if (vo == null) {
				favorit = 1;
				faService.insertFavorit(list);
			} else {
				favorit = 0;
				faService.deleteFavorit(vo.getFvrNo());
			}
		} else {
			favorit = -1;
		}
		System.out.println(favorit + " out");
		return favorit;

	}

	// ???????????? ??????
	@RequestMapping("/myFavorit")
	public String myFavorit(HttpSession session, Model model) {
		int memNo = (int) session.getAttribute("No");
		ArrayList<FavoritVO> fvList = faService.selectFavoritList(memNo);

		ArrayList<PostVO> postList = new ArrayList<PostVO>();
		ArrayList<String> memIdList = new ArrayList<String>();

		for (FavoritVO fv : fvList) {
			postList.add(postService.detailVeiwPost(Integer.parseInt(fv.getPostNo())));
			memIdList.add(memService.searchMemId(Integer.parseInt(fv.getPostNo())));
		}

		model.addAttribute("postList", postList);
		model.addAttribute("memIdList", memIdList);

		return "/post/myFavoritList";
	}

	// ??????????????? ?????? ?????????
	@GetMapping("/list")
	public String getList(@RequestParam("a") String memAddress1, Model model) {
		ArrayList<PostVO> list = postService.list(memAddress1);

		model.addAttribute("list", list);

		return "list";
	}

	@RequestMapping(value="/phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) {

		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);

		testService.certifiedPhoneNumber(userPhoneNumber,randomNumber);

		return Integer.toString(randomNumber);

	}
				
				
				
}
				
		
