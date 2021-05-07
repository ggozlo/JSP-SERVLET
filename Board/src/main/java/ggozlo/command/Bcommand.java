package ggozlo.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggozlo.BoardDAO;

public interface Bcommand 
{
	String execute( HttpServletRequest request, HttpServletResponse response, BoardDAO bdao);
}
