
Imports System
Imports System.ComponentModel
Imports System.Text
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls


<ToolboxData("<{0}:FlashPlayer runat=server></{0}:FlashPlayer>")> _
Public Class FlashPlayer
    Inherits WebControl

#Region "Properties defaults"
    Const DefaultSwfobject_jsLocation As String = "" ' in the same directory
    Const DefaultFlashPlayerLocation As String = "" ' in the same directory
    Const DefaultAllowFullScreen As Boolean = True
    Const DefaultFile As String = ""
    Const DefaultAutoStart As Boolean = False
    Const DefaultBufferLength As Integer = 1
    Const DefaultFullScreen As Boolean = False
    Const DefaultMute As Boolean = False
    Const DefaultQuality As Boolean = True
    Const DefaultVolume As Integer = 90
#End Region

    <Bindable(True), Category("Settings")> _
    Property Swfobject_jsLocation() As String
        Get
            If ViewState("Swfobject_jsLocation") Is Nothing Then
                Return DefaultSwfobject_jsLocation
            Else
                Return ViewState("Swfobject_jsLocation")
            End If
        End Get
        Set(ByVal value As String)
            If value <> DefaultSwfobject_jsLocation Then
                ViewState("Swfobject_jsLocation") = value
            Else
                ViewState("Swfobject_jsLocation") = Nothing
            End If
        End Set
    End Property

    <Bindable(True), Category("Settings")> _
    Property FlashPlayerLocation() As String
        Get
            If ViewState("FlashPlayerLocation") Is Nothing Then
                Return DefaultFlashPlayerLocation
            Else
                Return ViewState("FlashPlayerLocation")
            End If
        End Get
        Set(ByVal value As String)
            If value <> DefaultFlashPlayerLocation Then
                ViewState("FlashPlayerLocation") = value
            Else
                ViewState("FlashPlayerLocation") = Nothing
            End If
        End Set
    End Property

    <Bindable(True), Category("Settings")> _
    Property AllowFullScreen() As Boolean
        Get
            If ViewState("AllowFullScreen") Is Nothing Then
                Return DefaultAllowFullScreen
            Else
                Return ViewState("AllowFullScreen")
            End If
        End Get
        Set(ByVal value As Boolean)
            If value <> DefaultAllowFullScreen Then
                ViewState("AllowFullScreen") = value
            Else
                ViewState("AllowFullScreen") = Nothing
            End If
        End Set
    End Property

    <Bindable(True), Category("Settings")> _
    Property File() As String
        Get
            If ViewState("File") Is Nothing Then
                Return DefaultFile
            Else
                Return viewstate("File")
            End If
        End Get
        Set(ByVal value As String)
            If value <> DefaultFile Then
                ViewState("File") = value
            Else
                viewstate("File") = Nothing
            End If
        End Set
    End Property

    <Bindable(True), Category("Settings")> _
    Property AutoStart() As Boolean
        Get
            If ViewState("AutoStart") Is Nothing Then
                Return DefaultAutoStart
            Else
                Return ViewState("AutoStart")
            End If
        End Get

        Set(ByVal value As Boolean)
            If value <> DefaultAutoStart Then
                ViewState("AutoStart") = value
            Else
                ViewState("AutoStart") = Nothing
            End If
        End Set
    End Property

    <Bindable(True), Category("Settings")> _
    Property BufferLength() As Integer
        Get
            If ViewState("BufferLength") Is Nothing Then
                Return DefaultBufferLength
            Else
                Return ViewState("BufferLength")
            End If
        End Get
        Set(ByVal value As Integer)
            If value <> DefaultBufferLength Then
                ViewState("BufferLength") = value
            Else
                ViewState("BufferLength") = Nothing
            End If
        End Set
    End Property

    <Bindable(True), Category("Settings")> _
    Property FullScreen() As Boolean
        Get
            If ViewState("FullScreen") Is Nothing Then
                Return DefaultFullScreen
            Else
                Return ViewState("FullScreen")
            End If
        End Get
        Set(ByVal value As Boolean)
            If value <> DefaultFullScreen Then
                ViewState("FullScreen") = value
            Else
                ViewState("FullScreen") = Nothing
            End If
        End Set
    End Property

    <Bindable(True), Category("Settings")> _
    Property Mute() As Boolean
        Get
            If ViewState("Mute") Is Nothing Then
                Return DefaultMute
            Else
                Return ViewState("Mute")
            End If
        End Get
        Set(ByVal value As Boolean)
            If value <> DefaultMute Then
                ViewState("Mute") = value
            Else
                ViewState("Mute") = Nothing
            End If
        End Set
    End Property

    <Bindable(True), Category("Settings")> _
    Property Quality() As Boolean
        Get
            If ViewState("Quality") Is Nothing Then
                Return DefaultQuality
            Else
                Return ViewState("Quality")
            End If
        End Get
        Set(ByVal value As Boolean)
            If value <> DefaultQuality Then
                ViewState("Quality") = value
            Else
                ViewState("Quality") = Nothing
            End If
        End Set
    End Property

    <Bindable(True), Category("Settings")> _
    Property Volume() As Integer
        Get
            If ViewState("Volume") Is Nothing Then
                Return DefaultVolume
            Else
                Return ViewState("Volume")
            End If
        End Get
        Set(ByVal value As Integer)
            If value <> DefaultVolume Then
                ViewState("Volume") = value
            Else
                ViewState("Volume") = Nothing
            End If
        End Set
    End Property

    Protected Overrides Sub RenderContents(ByVal output As HtmlTextWriter)
        Dim content As StringBuilder = New StringBuilder
        content.Append("<div id=""" & ClientID & _
        "container""><a href=""http://www.macromedia.com/go/getflashplayer"">Get the Flash Player</a> to see this player.</div>" & vbCrLf)
        content.Append("<script type=""text/javascript"" src=""" & Swfobject_jsLocation & "swfobject.js""></script>" & vbCrLf)
        content.Append("<script type=""text/javascript"">" & vbCrLf)
        content.Append("var s1 = new SWFObject(""" & FlashPlayerLocation & _
        "player.swf"",""ply"",""" & Width.ToString() & """,""" & Height.ToString() & """,""#FFFFFF"")" & vbCrLf)

        content.Append("s1.addParam(""allowfullscreen"",""" & AllowFullScreen.ToString().ToLower() & """)" & vbCrLf)
        content.Append("s1.addVariable(""file"",""" & File & """)" & vbCrLf)
        content.Append("s1.addVariable(""autostart"", """ & AutoStart.ToString().ToLower() & """)" & vbCrLf)
        content.Append("s1.addVariable(""bufferlength"", """ & BufferLength.ToString() & """)" & vbCrLf)
        content.Append("s1.addVariable(""fullscreen"", """ & FullScreen.ToString().ToLower() & """)" & vbCrLf)
        content.Append("s1.addVariable(""mute"", """ & Mute.ToString().ToLower() & """)" & vbCrLf)
        content.Append("s1.addVariable(""quality"", """ & Quality.ToString().ToLower() & """)" & vbCrLf)
        content.Append("s1.addVariable(""volume"", """ & Volume.ToString() & """)" & vbCrLf)

        content.Append("s1.write(""" & ClientID & "container"")" & vbCrLf)
        content.Append("</script>")
        output.Write(content)
    End Sub

End Class

