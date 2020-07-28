<%@page import="project.review.dao.ReviewDao"%>
<%@page import="java.util.List"%>
<%@page import="project.review.dto.ReviewDto"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>

<%@page import="java.io.File"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    //요청 인코딩 설정(한글 깨지지않게)
    request.setCharacterEncoding("utf-8");
    
    String r_writer=(String)session.getAttribute("id");
    
    //업로드 설정
	final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
	//최대 업로드 사이즈 설정
	final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
	//최대 요청 사이즈 설정(최대 업로드 사이즈보다 크게 설정해야한다.)
	final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
	
    //실제로 업로드한 파일이 있는지 체크 한다.
    if (!ServletFileUpload.isMultipartContent(request)) {
        //업로드한 파일이 없다면 예외 처리를 한다. 
        PrintWriter writer = response.getWriter();
        writer.println("Error: Form must has enctype=multipart/form-data.");
        writer.flush();
        return;
    }

    // configures upload settings
    DiskFileItemFactory factory = new DiskFileItemFactory();
    // sets memory threshold - beyond which files are stored in disk
    factory.setSizeThreshold(MEMORY_THRESHOLD);
    // sets temporary location to store files
    factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
    ServletFileUpload upload = new ServletFileUpload(factory);
    // sets maximum size of upload file
    upload.setFileSizeMax(MAX_FILE_SIZE);
    // sets maximum size of request (include file + form data)
    upload.setSizeMax(MAX_REQUEST_SIZE);

    //WebContent 하위의 upload 폴더 절대 경로 얻어오기 
    String uploadPath = application.getRealPath("/upload");
    //업로드 경로를 서버측 콘솔에 출력하기
    System.out.println(uploadPath);
    //전송된 파라미터의 한글 인코딩 설정 
    upload.setHeaderEncoding("utf-8");
    
    String r_content="";
    //WebContent안에서 이미지 파일이 저장된 경로
    String r_imagePath="";
    //작업의 성공 여부
    boolean isSuccess=false;
    //글번호를 저장할 지역번수
    int seq=0;
    try {
        //폼전송된 아이템 목록 얻어오기 
        List<FileItem> formItems = upload.parseRequest(request);
        //폼전송된 아이템이 존재 한다면 
        if (formItems != null && formItems.size() > 0) {

            //반복문 돌면서 FileItem 객체를 불러온다. 
            for (FileItem item : formItems) {
            	
                //아이템이 폼 필드인지 아닌지에 따라 선택적인 처리를 한다.
                if (!item.isFormField()) {//만일 파일 필드라면...
                	//전송된 원본 파일명을 얻어온다. 
                    String orgFileName = new File(item.getName()).getName();
                	//저장할 파일명 구성(파일명 앞에 time stamp를 출력해서 겹치지 않게한다)
                	String saveFileName = System.currentTimeMillis()+orgFileName;
                	//파일 시스템에 저장할 전체 경로를 구성한다.
                    String filePath = 
                    	uploadPath + File.separator + saveFileName;
                	//파일을 파일시스템에 저장한다.
                    File storeFile = new File(filePath);
                    item.write(storeFile);
                   
                    //이미지 경로
                    r_imagePath="/upload/"+saveFileName;
                    
                }else{//폼 필드라면 
                	
                	//input type="file" 인것 이외의 전송된 input요소를 추출하는 위치
                	
                	if(item.getFieldName().equals("r_content")){
                		r_content=item.getString("utf-8");
                	}
                	if(item.getFieldName().equals("r_writer")){
                		r_writer=item.getString("utf-8");
                	}
                }//if
            }//for
        }//if
        seq=ReviewDao.getInstance().getSequence();
        //업로드된 사진 정보를 dto에 담고
        ReviewDto dto=new ReviewDto();
        dto.setR_num(seq);
        dto.setR_writer(r_writer);
        dto.setR_content(r_content);
        dto.setR_imagePath(r_imagePath);
        //DB에 저장하기
        isSuccess=ReviewDao.getInstance().insert(dto);
        
    } catch (Exception ex) {
     	//예외가 발생했을 때 상황에 맞게 응답 - 에러메세지가 뜨게할 수도 있고 등등
        System.out.println(ex.getMessage());
    }
   
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>알림</h1>
	<%if(isSuccess) { %>
	<p>
		<strong><%=r_writer %></strong>님이 작성한 리뷰가 저장되었습니다.
		<a href="fooddetail.jsp?snum=${snum }">확인</a>
	</p>
	<%}else { %>
	<p>
		글 저장이 실패되었습니다.
		<a href="private/review_form.jsp">다시 작성하기</a>
	</p>
	<%} %>

</body>
</html>