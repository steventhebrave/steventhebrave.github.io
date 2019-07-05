SetTitleMatchMode, 2
$.::
ifWinActive dshow
{
	WinActivate PowerPoint Slide
	WinActivate PowerPoint Presenter
} else {
	ifWinActive PowerPoint Presenter
	{
		WinActivate dshow
	} else {
		Send .
	}
}
Return

