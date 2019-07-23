<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<HTML>

<HEAD>
<TITLE>웹에디터 예제3</TITLE>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<SCRIPT langauge="javascript">
function htmledit(excute,values)
{
        if(values==null)
        {
                dhtmlframe.document.execCommand(excute);
        }
        else
        {
                dhtmlframe.document.execCommand(excute,"",values);
        }
}
</SCRIPT>
</HEAD>

<BODY>
<A href="javascript:htmledit('cut');">자르기</a>
<A href="javascript:htmledit('copy');">복사</a>
<A href="javascript:htmledit('paste');">붙여넣기</a>
<A href="javascript:htmledit('justifyleft');">좌측정렬</a>
<A href="javascript:htmledit('justifycenter');">중심정렬</a>
<A href="javascript:htmledit('justifyright');">우측정렬</a>
<A href="javascript:htmledit('insertorderedlist');">점표시목록</a>
<A href="javascript:htmledit('insertunorderedlist');">숫자목록</a>
<A href="javascript:htmledit('outdent');">들여쓰기줄이기</a>
<A href="javascript:htmledit('indent');">들여쓰기늘이기</a>
<A href="javascript:htmledit('createlink');">링크</a><BR>
글꼴 &gt;
<A href="javascript:htmledit('fontname','굴림');">굴림</a>
<A href="javascript:htmledit('fontname','궁서');">궁서</a>
글크기 &gt;
<A href="javascript:htmledit('fontSize',2);">2</a>
<A href="javascript:htmledit('fontSize',3);">3</a>
<A href="javascript:htmledit('fontSize',4);">4</a>
<A href="javascript:htmledit('bold');">볼드</A>
<A href="javascript:htmledit('italic');">이탤릭</A>
<A href="javascript:htmledit('underline');">언더라인</A>
<P><IFRAME NAME=dhtmlframe></IFRAME>

<SCRIPT LANGUAGE="JavaScript">
	dhtmlframe.document.designMode = "On"

</SCRIPT> 
</BODY>

</HTML>