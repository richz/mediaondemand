<%@ Page Language="C#" %>
<%@ Register Assembly="MattBerseth.WebControls.AJAX" Namespace="MattBerseth.WebControls.AJAX.Progress" TagPrefix="mb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="_assets/css/progress.css" rel="stylesheet" />     
    <style type="text/css">
    BODY{ padding:5px 20px; }
    .demo
    {
    	background-color:aliceblue;
    	border:solid 1px #3399ff;
    	padding:20px;
    	font-family:Calibri;
    }
    H3
    {
    	margin:0;
    	padding-bottom:10px;
    	font-weight:normal;
    }
    TH
    {
    	font-weight:normal;
    	text-align:left;
    	padding:4px;
    }
    TD
    {
    	width:150px;
    	text-align:center;
    }
    .modalBackground 
    {
        background-color:Gray;
        filter:alpha(opacity=30);
        opacity:0.30;         
    }  
    .popup
    {
    	border:solid 1px #111;
    	background-color:#fff;
    	padding:10px 5px;
    }  
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="scriptManager" runat="server" />
    <script type="text/javascript">
    
    function pageLoad(){
    
        //  demo 1
        $find('ProgressControl1').play();

        //  demo 2
        $find('ProgressControl2').set_percentage(62);
    
        //  demo 3
        $find('ProgressControl4').set_percentage(35);
        $find('ProgressControl5').set_percentage(55);
        $find('ProgressControl6').set_percentage(25);
        $find('ProgressControl7').set_percentage(75);
        $find('ProgressControl8').set_percentage(65);
        $find('ProgressControl11').set_percentage(82);
        $find('ProgressControl13').set_percentage(78);
        
        // demo 4
        $find('ProgressControl9').set_percentage(50);   
        
        //  demo 5
        $find('mdp').add_shown(function(){
            $find('ProgressControl12').play();
            
            //  hide it after 5 seconds
            window.setTimeout(function(){
                $find('mdp').hide();
            }, 5000);            
        }); 
        $find('mdp').add_hidden(function(){
            $find('ProgressControl12').stop();
        });         
    }
    
    </script>  
    <div>
    
        <div id="continuous" class="demo">
            <h3>Continous Mode</h3>
            <mb:ProgressControl ID="ProgressControl1" runat="server" Mode="Continuous" Width="150px" />
        </div>
        <br />
        <div id="manual-fluid" class="demo">
            <h3>Fluid Width</h3>
            <mb:ProgressControl ID="ProgressControl2" runat="server" Mode="Manual" Width="350px" />            
        </div>
        <br />        
        <div id="manual-absolute" class="demo">
            <h3>Manual Mode - Update absolute percentage</h3>
            <mb:ProgressControl ID="ProgressControl3" runat="server" Mode="Manual" Width="200px" />
            <br />
            <script type="text/javascript">
                function onAbsoluteRadioClick(sender){
                    $find('ProgressControl3').set_percentage(sender.value);
                }
            </script>

            <input type="radio" name="manual-absolute" onclick="onAbsoluteRadioClick(this);" value="10" />10%
            <input type="radio" name="manual-absolute" onclick="onAbsoluteRadioClick(this);" value="25" />25%
            <input type="radio" name="manual-absolute" onclick="onAbsoluteRadioClick(this);" value="50" />50%
            <input type="radio" name="manual-absolute" onclick="onAbsoluteRadioClick(this);" value="78" />78%
            <input type="radio" name="manual-absolute" onclick="onAbsoluteRadioClick(this);" value="100" />100%
        </div>      
        <br />
        <div id="manual-relative" class="demo">
            <h3>Manual Mode - Update relative percentage</h3>
            <mb:ProgressControl ID="ProgressControl9" runat="server" Mode="Manual" Width="200px" />
            <br />
            <script type="text/javascript">
                function onRelativeRadioClick(sender){
                    $find('ProgressControl9').set_percentage(sender.value);
                }
            </script>

            <input type="button" name="manual-relative" onclick="onRelativeRadioClick(this);" value="+25" />
            <input type="button" name="manual-relative" onclick="onRelativeRadioClick(this);" value="-35" />
        </div>      
        <br />        
        <div id="skins" class="demo">
            <h3>JavaScript/CSS based Progress Indicator</h3>
            <mb:ProgressControl ID="ProgressControl4" runat="server" CssClass="green" Mode="Manual" Width="200px" />            
            <br />
            <mb:ProgressControl ID="ProgressControl5" runat="server" CssClass="yelllow" Mode="Manual" Width="200px" />            
            <br />
            <mb:ProgressControl ID="ProgressControl6" runat="server" CssClass="orange" Mode="Manual" Width="200px" />            
            <br />
            <mb:ProgressControl ID="ProgressControl7" runat="server" CssClass="red" Mode="Manual" Width="200px" />            
            <br />                                    
            <mb:ProgressControl ID="ProgressControl8" runat="server" CssClass="lightblue" Mode="Manual" Width="200px" />            
            <br />                                                
            <mb:ProgressControl ID="ProgressControl11" runat="server" CssClass="solidblue" Mode="Manual" Width="200px" />            
            <br />                                                            
            <mb:ProgressControl ID="ProgressControl13" runat="server" CssClass="xp" Mode="Manual" Width="200px" />            
            <br />               
        </div>  
        <br />        
        <div id="form" class="demo">
            <h3>AJAX Operations</h3>
            <mb:ProgressControl ID="ProgressControl10" runat="server" CssClass="green" Mode="Manual" Width="200px" />            
            <script type="text/javascript">
                function onAjaxClick(sender){
                    sender.disabled = true;
                
                    window.setTimeout(function(){
                        sender.value = 'Done!';
                        $find('ProgressControl10').set_percentage('+20');
                    }, Math.random() * 5000);
                }
            </script>            
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <th>Operation 1</th><td><input type="button" onclick="onAjaxClick(this);" value="Execute" /></td>
                </tr>
                <tr>
                    <th>Operation 2</th><td><input type="button" onclick="onAjaxClick(this);" value="Execute" /></td>
                </tr>
                <tr>
                    <th>Operation 3</th><td><input type="button" onclick="onAjaxClick(this);" value="Execute" /></td>
                </tr>
                <tr>
                    <th>Operation 4</th><td><input type="button" onclick="onAjaxClick(this);" value="Execute" /></td>
                </tr>
                <tr>
                    <th>Operation 5</th><td><input type="button" onclick="onAjaxClick(this);" value="Execute" /></td>
                </tr>                                                                
            </table>
        </div> 
        <br />
        <div id="Div1" class="demo">
            <h3>Modal Popup</h3>
            <asp:Panel ID="panel" runat="server" CssClass="popup" style="display:none">
                <mb:ProgressControl ID="ProgressControl12" runat="server" CssClass="xp" Mode="Continuous" Width="175px" />            
                Loading ...
            </asp:Panel>
            <asp:Button ID="btnPopup" runat="server" Text="Show Popup" />
            <ajaxToolkit:ModalPopupExtender ID="mdpPopup" BehaviorID="mdp" runat="server" TargetControlID="btnPopup" PopupControlID="panel" BackgroundCssClass="modalBackground" />
        </div>  
        <br />         
        <br />
    </div>
    </form>
</body>
</html>
