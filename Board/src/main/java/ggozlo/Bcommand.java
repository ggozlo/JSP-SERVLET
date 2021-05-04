package ggozlo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Bcommand 
{
	String execute( HttpServletRequest request, HttpServletResponse response, BoardDAO bdao);
}
