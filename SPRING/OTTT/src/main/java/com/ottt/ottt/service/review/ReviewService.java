package com.ottt.ottt.service.review;

import java.util.List;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.CommentDTO;
import com.ottt.ottt.dto.ContentDirectorDTO;
import com.ottt.ottt.dto.ContentPosterDTO;
import com.ottt.ottt.dto.ContentTrailerDTO;
import com.ottt.ottt.dto.DirectorDTO;
import com.ottt.ottt.dto.EntertainerDTO;
import com.ottt.ottt.dto.ReportDTO;
import com.ottt.ottt.dto.ReviewDTO;
import com.ottt.ottt.dto.ReviewLikeDTO;

public interface ReviewService {
	//리뷰 페이지
    int removeReview(Integer review_no, Integer user_no) throws Exception;
    int modifyReview(ReviewDTO reviewDTO) throws Exception;
    int writeReview(ReviewDTO dto) throws Exception;
    double getRatingAvg(Integer content_no)throws Exception; 
    int getCount(int content_no)throws Exception;
    int getDuplication(Integer content_no, int user_no) throws Exception; 
    int reviewReport(ReportDTO reportDTO) throws Exception;
    ReviewDTO getReviewNo(Integer content_no,Integer user_no ) throws Exception; 
    
    List<ReviewDTO> getReview(int content_no) throws Exception;
    int selectLikeCount(ReviewLikeDTO dto) throws Exception;
    
    int insertLike(ReviewLikeDTO dto) throws Exception;
    
    int deleteLike(ReviewLikeDTO dto) throws Exception;
    
    
    List<ContentPosterDTO> getPoster(int content_no) throws Exception;
    
    List<ContentTrailerDTO> getTrailer(int content_no) throws Exception;
    
    DirectorDTO getDirector(int content_no) throws Exception;
    
    List<EntertainerDTO> getEntertainer(int content_no) throws Exception;
    
    //리플 페이지
    CommentDTO getReply(Integer cmt_no) throws Exception;
    int getReplyCount(Integer review_no) throws Exception;
    ReviewDTO getReplyReview(Integer content_no, Integer review_no)throws Exception;
    List<CommentDTO> getallreply(Integer review_no) throws Exception;
    int writeReply(CommentDTO commentDTO) throws Exception;
    int removeReply(Integer cmt_no, Integer user_no) throws Exception;
    int removeReplyReview(Integer review_no, Integer user_no) throws Exception;
    int modifyReplyReview(ReviewDTO reviewDTO)throws Exception;
    int modifyReply(CommentDTO CommentDTO) throws Exception;
    int replyReport(ReportDTO reportDTO) throws Exception;
    
    //나의 리뷰
    List<ReviewDTO> getMyReview(SearchItem sc) throws Exception;
    int myReviewCnt(SearchItem sc) throws Exception;
    
  	//좋아요 한 리뷰
    List<ReviewDTO> getLikeReview(SearchItem sc) throws Exception;
    int likeReviewCnt(SearchItem sc) throws Exception;
    
  	//댓글 작성 리뷰
    List<ReviewDTO> getCmtReview(SearchItem sc) throws Exception;
    int cmtReviewCnt(SearchItem sc) throws Exception;
}