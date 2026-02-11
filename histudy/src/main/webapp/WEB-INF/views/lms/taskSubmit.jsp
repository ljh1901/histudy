<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/histudy/css/header.css">
<link rel="stylesheet" type="text/css" href="/histudy/css/footer.css">
<link rel="stylesheet" type="text/css" href="/histudy/css/root.css">
<style>
	.taskSubmitBody header{
		background-color: white;
		box-shadow: 0 2px 8px rgba(0,0,0,0.06);
	}
	.taskSubmitTopSection{
		margin-top: 80px;
		background: linear-gradient(
	        180deg,
	        #f5f7ff 0%,
	        #f8f5ff 40%,
	        #fff7fb 100%
	    );
		padding: 3.5rem 5rem;
	}
	.TSContainer{
		max-width:1200px;
		margin: 0 auto;
	}
	.TSContainer__top{
		margin-bottom: 10px;
	}
	.TSContainer__top P{
	    color: #888;
	    padding-bottom: 10px;
		font-size: 0.8rem;
	}
	.TSContainer__title{
		font-size: 4rem;
		font-weight: 600;
	}
	.TSContainer__sub{
		font-size: 1.5rem;
		color: #888;
	}
	.taskSubmitForm{
		padding: 1rem;
		background-color: #FAFAFA;
	}
	.TSFContainer{
		padding: 1rem;
		max-width:1200px;
		margin: 0 auto;
	}
	.taskSubmitContentForm{
		background-color: white;
		margin-top:30px;
		padding: 1rem;
	}
	.taskData{
		background-color: white;
		border: none;
		border-radius: 15px;
		margin: 0 auto;
		padding: 2rem 4rem;
	}
	.tag-weeks{
		 display: inline-block;
	     padding: 6px 14px;
	     font-size: 1rem;
	     font-weight: 500;
	     border-radius: 999px; 
	     background-color: #F2F4F6;
	     color: #374152;
	}
	.tag-title{
		 display: inline-block;
	     padding: 6px 14px;
	     font-size: 1rem;
	     font-weight: 500;
	     border-radius: 999px; 
	     background-color: #F3E8FF;
	     color: #7C3AED;  
	}
	.lmsCenterContainer__rightBox__card__middle{
		margin-top: 10px;
	}
	.lmsCenterContainer__rightBox__card__middle h3{
		font-weight: 600;
		margin-bottom: 10px;
		font-size: 2rem;
	}
	.lmsCenterContainer__rightBox__card__middle p{
		color: #4B5563;
		margin-bottom: 10px;
		font-size:1.4rem;
	}

	.lmsCenterContainer__rightBox__middle__file{
		display: flex;
		align-items: center;
		gap: 1rem;
	}
	.lmsCenterContainer__rightBox__middle__file p{
		font-size: 1rem;
	}
	.files__file{
		display: flex;
		align-items: center;
	    background-color: #F2F4F6;
	    color: #374152;
		font-size: 0.7rem;
		padding: 0.5rem;
		border-radius: 15px;
	}
	.files__file img{
		width: 13px;
		height: 13px;
		margin-right: 10px;
	}
	.files__file:hover{
		cursor: pointer;
	}
	.lmsCenterContainer__rightBox__card__row{
		margin-top: 20px;
		border-top: 1px solid #ccc;
		display: flex;
		align-items: center;
		justify-content: space-between;
	}
	.row__left{
		display: flex;
		align-items: center;
		margin-top:20px;
	}
	.row__left img{
		width:30px;
		height: 30px;
		margin-right: 10px;
	}
	.row__left p{
		font-size: 1.3rem;
		color: #888;
	}
	.row__left .endDateText{
		color: red;
		margin-left: 20px;
	}
	.TIF_card{
	  display: flex;
      justify-content: flex-start;
      flex-direction: column;
      text-align: left;
      margin-bottom: 20px;
	}
	.TIF_card label{
	  margin-bottom: 10px;
      margin-top: 10px;
      font-weight: bold;
      font-size: 1.3rem;
      margin-right: 10px;
	}
   .TIF_card textarea{
      border-radius: 10px;
      padding:1rem;
      resize: none;
   }
   .TIF_card p{
   	  font-size: 0.8rem;
      color: #888;
   }
   .TIF_card span{
      color: red;
   }
   .TIF_card div{
   	width: 100%;
   }
   .TIF_card_file{
   	 border: 1px double #ccc;
   	 border-radius: 10px;
   	 padding:5rem;
   	 background-color: #F9FAFB;
   	 text-align: center;
   }
   .TIF_card_file_imgbox img{
   	 width: 80px;
   	 height: 80px;
   }
   .TIF_card_imgBox{
   	 max-width:70px;
   }
   .TIF_card_imgBox img{
   	 width: 70px;
   	 height: 70px;
   }
   .task_guide{
   	 background-color: #FFFBEB;
   	 display: flex;
   	 padding: 1rem;
   	 border-radius: 10px;
   }
   .TIF_card_text{
   	 margin-left: 20px;
   	 line-height: 2rem;
   }
   .TIF_card_text li{
   	 color: #888;
   	 font-size: 0.9rem;
   }
   	.taskData2{
		background-color: white;
		border: none;
		border-radius: 15px;
		margin: 0 auto;
		padding: 2rem 4rem;
		margin-top: 35px;
	}
   .taskData2__title{
   		font-size: 1.7rem;
   		font-weight: 600;
   		margin-bottom: 20px;
   }
   .TIF_card_keynum{
   		margin-top:10px;
   		display: flex;
   		justify-content: space-between;
   }
    .TIF_btns{
   	  display: flex;
   	  margin-top:50px;
   }
   .TIF_btns input[type="reset"]{
   	  width: 100%;
   	  background-color: white;
   	  border: 1px solid black;
      border-radius: 10px;
      font-size: 1.3rem;
      padding: 1rem;
   }
   .TIF_btns input[type="reset"]:hover{
   	 background-color: var(--color-navy);
   	 color: white;
   	 cursor: pointer;
   }
   .TIF_btns input[type="submit"]{
      width:100%;
      background-color: #111827;
      color: white;
      border: 1px solid #ccc;
      border-radius: 10px;
      font-size: 1.3rem;
      padding: 1rem;
   }
   .TIF_btns input[type="submit"]:hover{
      cursor: pointer;
      background-color: var(--color-navy);
      cursor: pointer;
   }
</style>
</head>
<body class="taskSubmitBody">
<%@include file="../header.jsp" %>
<main>
	<form name="taskSubmit" action="taskSubmitOk.do" method="post" enctype="multipart/form-data">
	<section class="taskSubmitTopSection">
		<div class="TSContainer">
			<div class="TSContainer__top">
				<p>LMS &nbsp; > &nbsp; 과제 제출</p>
			</div>
			<h1 class="TSContainer__title">과제 제출</h1>
			<p class="TSContainer__sub">과제를 완료하고 제출하세요</p>
		</div>
	</section>
	<section class="taskSubmitForm">
		<div class="TSFContainer">
			<div class="taskData">
				<div class="lmsCenterContainer__rightBox__card">
					<div class="lmsCenterContainer__rightBox__card__top">
						<span class="tag-title">${study_title}</span>
						<span class="tag-weeks">${taskData.a_weeks}주차</span>
					</div>
					<div class="lmsCenterContainer__rightBox__card__middle">
						<h3>${taskData.a_title}</h3>
						<p>${taskData.a_content }</p>
						<div class="lmsCenterContainer__rightBox__middle__file">
							<p>첨부 파일</p>
							<div class="files__file">
								<img src="/histudy/lms-img/clip.png">
								<span>${taskData.a_fname}</span>
							</div>
						</div>
					</div>
					<div class="lmsCenterContainer__rightBox__card__row">
						<div class="row__left">
							<img src="/histudy/lms-img/calendar.png">
							<p>마감일: &nbsp;</p>
							<p>${taskData.a_end_date}</p>
							<p class="endDateText">마감</p>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="a_idx" value="${taskData.a_idx}">
			<div class="taskData2">
				<h3 class="taskData2__title">과제 제출하기</h3>
				<div class="TIF_card">
					<label>제출 내용 <span>*</span></label>
					<textarea name="as_content" rows="20" cols="40"></textarea>
					<div class="TIF_card_keynum">
						<p>최소 100자 이상 작성해주세요</p>
						<p>0자</p>
					</div>
				</div>
				<div class="TIF_card">
					<label>파일 첨부</label>
					<div class="TIF_card_file">
						<div class="TIF_card_file_imgbox">
							<img src="/histudy/lms-img/fileimg.png">
						</div>
						<p>파일을 드래그하거나 클릭하여 업로드</p>
						<p>PDF, ZIP, 이미지 파일 등 (최대 50MB)</p>
						<input type="file" name="prve_as_fname">
					</div>
				</div>
				<div class="TIF_card">
					<div class="task_guide">
						<div class="TIF_card_imgBox">
							<img src="/histudy/lms-img/guide2.png">
						</div>
						<div class="TIF_card_text">
							<h3>제출 전 확인 사항</h3>
							<ul>
								<li>- 과제 요구사항을 모두 충족했는지 확인해주세요</li>
								<li>- 제출 후에도 마감 전까지 수정이 가능합니다</li>
								<li>- 마감일 이후에는 제출 및 수정이 불가능합니다</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="TIF_btns">
					<input type="reset" value="취소">
					<input type="submit" value="제출하기">
				</div>
			</div>
		</div>
	</section>
	</form>
</main>
<%@include file="../footer.jsp" %>
</body>
</html>