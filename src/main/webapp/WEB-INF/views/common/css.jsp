<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

.rounded {
	-webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px
		rgba(0, 0, 0, 0.24);
	-moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px
		rgba(0, 0, 0, 0.24);
	-ms-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px
		rgba(0, 0, 0, 0.24);
	-o-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px
		rgba(0, 0, 0, 0.24);
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	-webkit-transition: all 0.25s ease-in-out;
	-moz-transition: all 0.25s ease-in-out;
	-ms-transition: all 0.25s ease-in-out;
	-o-transition: all 0.25s ease-in-out;
	transition: all 0.25s ease-in-out;
}

.jb-wrap {
    margin:5px;
	width: 120px;
	position: relative;
	
}

.jb-wrap img {
	width: 120px;
	height: 120px;
	vertical-align: middle;
}

.jb-text {
	position: absolute;
	top: 0px;
	width: 120px;
	height: 120px;
}

.jb-text-table {
	display: table;
	width: 120px;
	height: 120px;
}

.jb-text-table-row {
	display: table-row;
	width: 120px;
	height: 120px;
}

.jb-text-table-cell {
	display: table-cell;
	vertical-align: middle;
}

.jb-text p {
    opacity:0;
	width: 120px;
	height: 120px;
	background-color: #ffffff;
	text-align: center;
}

.jb-text p:hover {
    opacity:0.9;
    color:black;
    font-weight:bold;
    font-size:19px;
	width: 120px;
	height: 120px;
	background-color: #ffffff;
	text-align: center;
}
</style>