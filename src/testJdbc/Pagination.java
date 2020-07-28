package testJdbc;

public class Pagination {
	/**
	 * 
	 * @param pageNum
	 *            ��ǰҳ��
	 * @param pageCount
	 *            ��ҳ��
	 * @param recordCount
	 *            �ܼ�¼��
	 * @param pageUrl
	 *            ҳ�� URL
	 * @return
	 */
	public static String getPagination(int pageNum, int pageCount,
			int recordCount, String pageUrl) {

		String url = pageUrl.contains("?") ? pageUrl : pageUrl + "?";
		if(!url.endsWith("?") && !url.endsWith("&")){
			url += "&";
		}

		StringBuffer buffer = new StringBuffer();
		buffer.append("�� " + pageNum + "/" + pageCount + " ҳ �� " + recordCount
				+ " ��¼ ");

		buffer.append(pageNum == 1 ? " ��һҳ " : " <a href='" + url
				+ "pageNum=1'>��һҳ</a> ");
		buffer.append(pageNum == 1 ? " ��һҳ " : " <a href='" + url + "pageNum="
				+ (pageNum - 1) + "'>��һҳ</a> ");
		buffer.append(pageNum == pageCount ? " ��һҳ " : " <a href='" + url
				+ "pageNum=" + (pageNum + 1) + "'>��һҳ</a> ");
		buffer.append(pageNum == pageCount ? " ���һҳ " : " <a href='" + url
				+ "pageNum=" + pageCount + "'>���һҳ</a> ");

		buffer.append(" �� <input type='text' ");
		buffer.append("  name='goto_input' ");
		buffer.append("  style='width:25px; text-align:center; '> ҳ ");
		buffer.append(" <input type='button'");
		buffer.append("  name='goto_button' value='Go'>");

		buffer.append("<script language='javascript'>");
		buffer.append("function _enter(){");
		buffer.append("	if(event.keyCode == 13){");
		buffer.append("		_goto();");
		buffer.append("		return false;");
		buffer.append("	}");
		buffer.append("	return true;");
		buffer.append("} ");
		buffer.append("function _goto(){");
		buffer
				.append("	var numText = document.getElementsByName('goto_input')[0].value;");
		buffer.append("	var num = parseInt(numText, 10);");
		buffer.append("	if(!num){");
		buffer.append("		alert('ҳ������Ϊ����');	");
		buffer.append("		return;");
		buffer.append("	}");
		buffer.append("	if(num<1 || num>" + pageCount + "){");
		buffer.append("		alert('ҳ��������� 1����С����ҳ�� " + pageCount + " ');	");
		buffer.append("		return;");
		buffer.append("	}");
		buffer.append("	location='" + url + "pageNum=' + num;");
		buffer.append("}");
		buffer
				.append("document.getElementsByName('goto_input')[0].onkeypress = _enter;");
		buffer
				.append("document.getElementsByName('goto_button')[0].onclick = _goto;");
		buffer.append("</script>");

		return buffer.toString();
	}
}
