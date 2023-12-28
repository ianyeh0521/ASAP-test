package com.asap.forum.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.forum.entity.ForumReportTypeVO;
import com.asap.forum.entity.ForumReportVO;
import com.asap.forum.service.ForumReportVOService;
import com.asap.forum.service.ForumReportVOServiceImpl;
import com.asap.member.entity.MbrNewsVO;
import com.asap.member.service.MbrNewsService;
import com.asap.member.service.MbrNewsService_interface;

@WebServlet("/forum/forumreport.do")
public class ForumReportServlet extends HttpServlet {
	
	private ForumReportVOService forumreportVOService;

	@Override
	public void init() throws ServletException {
		forumreportVOService = new ForumReportVOServiceImpl();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		switch (action) {
		case "reportcomment":
			reportComment(req, res);
			break;
		case "reportpost":
			reportPost(req, res);
			break;
		case "postrptmgmt":
			postRptMgmt(req, res);
			break;
		case "cmtrptmgmt":
			cmtRptMgmt(req, res);
			break;
		
	}
	
	res.setContentType("text/html; charset=UTF-8");
		
	}

	private void cmtRptMgmt(HttpServletRequest req, HttpServletResponse res) {
		Integer fRptno = Integer.parseInt(req.getParameter("frptNo"));
		String  replyText =req.getParameter("replyText");
		String  mbrNo =req.getParameter("mbrNo");
		ForumReportVO forumReportVO= forumreportVOService.findByPK(fRptno);
		String  backNo =req.getParameter("backNo");
		forumReportVO.setBackNo(backNo);		
		forumReportVO.setfRptReply(replyText);
		forumReportVO.setfRptReplyTime(Timestamp.valueOf(LocalDateTime.now()));
		forumreportVOService.update(forumReportVO);
		MbrNewsVO mbrNews= new MbrNewsVO();
		mbrNews.setMbrNo(mbrNo);
		mbrNews.setNewsSubj("檢舉結果通知：檢舉單編號"+fRptno);
		mbrNews.setNewsText(replyText);
		MbrNewsService_interface mbrNewsSvc= new MbrNewsService();
	    mbrNewsSvc.add(mbrNews);
	}

	private void postRptMgmt(HttpServletRequest req, HttpServletResponse res) {
		Integer fRptno = Integer.parseInt(req.getParameter("frptNo"));
		String  replyText =req.getParameter("replyText");
		String  mbrNo =req.getParameter("mbrNo");
		ForumReportVO forumReportVO= forumreportVOService.findByPK(fRptno);
		String  backNo =req.getParameter("backNo");
		forumReportVO.setBackNo(backNo);
		forumReportVO.setfRptReply(replyText);
		forumReportVO.setfRptReplyTime(Timestamp.valueOf(LocalDateTime.now()));
		forumreportVOService.update(forumReportVO);
		MbrNewsVO mbrNews= new MbrNewsVO();
		mbrNews.setMbrNo(mbrNo);
		mbrNews.setNewsSubj("檢舉結果通知：檢舉單編號"+fRptno);
		mbrNews.setNewsText(replyText);
		MbrNewsService_interface mbrNewsSvc= new MbrNewsService();
	    mbrNewsSvc.add(mbrNews);
		
	}

	private void reportPost(HttpServletRequest req, HttpServletResponse res) {
		Integer postno = Integer.parseInt(req.getParameter("postno"));
		Integer rpttype = Integer.parseInt(req.getParameter("rpttype"));
		String mbrNo =req.getParameter("mbrNo");
		String rpttext =req.getParameter("rpttext");
		res.setContentType("application/json; charset=UTF-8");
		ForumReportVO forumReportVO= new ForumReportVO();
		forumReportVO.setfRptMsg(rpttext);
		ForumReportTypeVO fRptTypeVO= new ForumReportTypeVO(rpttype);
		forumReportVO.setForumReportTypeVO(fRptTypeVO);
		forumReportVO.setPostNo(postno);
		forumReportVO.setMbrNo(mbrNo);
		Integer fRptno=forumreportVOService.add(forumReportVO);
		MbrNewsVO mbrNews= new MbrNewsVO();
		mbrNews.setMbrNo(mbrNo);
		mbrNews.setNewsSubj("檢舉結果通知：檢舉單編號"+fRptno);
		mbrNews.setNewsText("您好，我們已經收到您的檢舉，若有近一步消息將再通知您，謝謝。ASAP團隊敬上");
		MbrNewsService_interface mbrNewsSvc= new MbrNewsService();
	    mbrNewsSvc.add(mbrNews);
		
	}

	private void reportComment(HttpServletRequest req, HttpServletResponse res) {
		Integer cmtno = Integer.parseInt(req.getParameter("cmtno"));
		Integer rpttype = Integer.parseInt(req.getParameter("rpttype"));
		String rpttext =req.getParameter("rpttext");
		String mbrNo =req.getParameter("mbrNo");
		res.setContentType("application/json; charset=UTF-8");
		ForumReportVO forumReportVO= new ForumReportVO();
		forumReportVO.setfRptMsg(rpttext);
		ForumReportTypeVO fRptTypeVO= new ForumReportTypeVO(rpttype);
		forumReportVO.setForumReportTypeVO(fRptTypeVO);
		forumReportVO.setCmtNo(cmtno);
		forumReportVO.setMbrNo(mbrNo);
		Integer fRptno=forumreportVOService.add(forumReportVO);
		MbrNewsVO mbrNews= new MbrNewsVO();
		mbrNews.setMbrNo(mbrNo);
		mbrNews.setNewsSubj("檢舉成功通知：檢舉單編號"+fRptno);
		mbrNews.setNewsText("您好，我們已經收到您的檢舉，若有近一步消息將再通知您，謝謝。ASAP團隊敬上");
		MbrNewsService_interface mbrNewsSvc= new MbrNewsService();
	    mbrNewsSvc.add(mbrNews);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
