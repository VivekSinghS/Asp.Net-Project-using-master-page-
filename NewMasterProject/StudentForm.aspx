<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="StudentForm.aspx.cs" Inherits="NewMasterProject.StudentForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <center>
        <table>
            <tr>
                <td>StudentName</td>
                <td>
                    <asp:TextBox ID="txtSName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Course</td>
                <td>
                    <asp:DropDownList ID="ddlCourse" runat="server">
                        <asp:ListItem Text="Select Course" Value="0"></asp:ListItem>
                        <asp:ListItem Text="BCA" Value="1"></asp:ListItem>
                        <asp:ListItem Text="BBA" Value="2"></asp:ListItem>
                        <asp:ListItem Text="MCA" Value="3"></asp:ListItem>
                        <asp:ListItem Text="MBA" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>City</td>
                <td>
                    <asp:DropDownList ID="DdlStCity" runat="server">
                        <asp:ListItem Text="Select City" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Bareilly" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Ayodhya" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mumbai" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Pilibhit" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>DOB</td>
                <td>
                    <asp:TextBox ID="txtDob" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSubmit2" runat="server" Text="Submit" OnClick="btnSubmit2_Click" /><br class="Apple-interchange-newline">
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:GridView ID="grdView" runat="server" OnRowCommand="grdView_RowCommand" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <%#Eval("stuId") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <%#Eval("Name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Course">
                                <ItemTemplate>
                                    <%#Eval("Course").ToString()=="1" ? "BCA" : Eval("Course").ToString()== "2" ?"BBA" : Eval("Course").ToString()=="3" ? "MCA" : "MBA"%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City">
                                <ItemTemplate>
                                    <%#Eval("City").ToString()=="1" ? "Bareilly" : Eval("City").ToString()=="2" ? "Ayodhya" : Eval("City").ToString()=="3" ? "Mumbai" : "Pilibhit"%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DOB">
                                <ItemTemplate>
                                    <%#Eval("DOB") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="dltBtn" runat="server" Text="Delete" CommandName="DltData" CommandArgument='<%#Eval("stuId")%>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="edtBtn" runat="server" Text="Edit" CommandName="EditData" CommandArgument='<%#Eval("stuId")%>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>


                    </asp:GridView>
                </td>
            </tr>

        </table>
        
   

        </center>

</asp:Content>
