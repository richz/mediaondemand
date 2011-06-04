<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MODMediaSlider.ascx.cs"
    Inherits="MediaOnDemand.usercontrols.Databound.MODMediaSlider" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<table>
    <tr>
        <td>
            <a id="lnkVideoLink" href="#" onclick="ForcePostBack(this, 'video')" mediatitle='<%# Eval("medTitle") %>'
                param='<%# Eval("medLocation") %>' mediaid='<%# Eval("medId") %>'>
                <asp:Label ID="lblTitle" runat="server" Width="100%" Text='<%# Bind("medTitle") %>'></asp:Label>
            </a>
        </td>
    </tr>
    <tr>
        <td>
            <a id="lnkVideoLink" href="#" onclick="ForcePostBack(this, 'video')" mediatitle='<%# Eval("medTitle") %>'
                param='<%# Eval("medLocation") %>' mediaid='<%# Eval("medId") %>'>
                <asp:Image ID="imgPosterImage" ImageUrl='<%# Bind("medPosterImageUrl") %>' Width="158px"
                    Height="216px" runat="server" />
            </a>
            <asp:Label ID="lblMissingImage" runat="server" Text="Please upload an image" Visible="false"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <div>
                <table>
                    <tr>
                        <td>
                            <asp:Rating ID="ratingControl1" ReadOnly="true" AutoPostBack="true" OnPreRender="ratingControl_PreRender"
                                CurrentRating='<%# Bind("medRating") %>' MaxRating="5" StarCssClass="rating_star"
                                FilledStarCssClass="rating_filled" EmptyStarCssClass="rating_empty" WaitingStarCssClass="rating_empty"
                                runat="server">
                            </asp:Rating>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="display: none">
                                <asp:ImageButton ID="btnSubmitRating1" CommandArgument='<%# Bind("medId") %>' Text="Submit"
                                    runat="server" ImageUrl="~/images/rating/savebutton.png" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
</table>


