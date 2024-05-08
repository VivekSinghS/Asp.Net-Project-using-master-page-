<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="EmployeeForm.aspx.cs" Inherits="NewMasterProject.EmployeeForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <center>
    <table>
       
        <tr>
            <td>Name</td>
            <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox> </td>
        </tr>
        <tr>
        <td>City</td>
             <td> <asp:DropDownList ID="ddlCity" runat="server">
                 <asp:ListItem Text="Select City" Value="0"> </asp:ListItem>
                 <asp:ListItem Text="Bareilly" Value="1"></asp:ListItem>
                 <asp:ListItem Text="Badaun" Value="2"></asp:ListItem>
                 <asp:ListItem Text="Moradabad" Value="3"></asp:ListItem>
                 <asp:ListItem Text="Pilibhit" Value="4"></asp:ListItem>
                  </asp:DropDownList> </td>
             </tr>
               <tr>
              <td>Gender</td>
           <td><asp:RadioButtonList ID="rblGender" runat="server" RepeatColumns="3">
               <asp:ListItem Text="Male" Value="1"></asp:ListItem>
               <asp:ListItem Text="Female" Value="2"></asp:ListItem>
               <asp:ListItem Text="Others" Value="3"></asp:ListItem>
               </asp:RadioButtonList> </td>
        </tr>
            <tr>
           <td>MobilNo</td>
         <td><asp:TextBox ID="txtMobilNo" runat="server"></asp:TextBox> </td>
          </tr>
                  <tr>
                      <td></td>
                  <td> <asp:LinkButton ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"></asp:LinkButton> </td>
                  </tr>

           <tr>
               <td></td>
                <td><asp:GridView ID="grd" runat="server" OnRowCommand="grd_RowCommand" AutoGenerateColumns="false">

                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <%#Eval("Id") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <%#Eval("Name") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="City">
                            <ItemTemplate>
                                <%#Eval("City").ToString()=="1" ? "Bareilly" :Eval("City").ToString()=="2" ? "Badaun" :Eval("City").ToString()=="Moradabad" ? "3" : "Pilibhit" %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>
                                <%#Eval("Gender").ToString()=="1" ?"Male" : Eval("Gender").ToString()== "2" ? "Female" : "Others" %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MobilNo">
                            <ItemTemplate>
                                <%#Eval("MobilNo")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                      <asp:TemplateField>
                          <ItemTemplate>
                             
                               <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CommandName="A" CommandArgument= '<%#Eval("Id")%>'></asp:LinkButton>
                          </ItemTemplate>
                      </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="editBtn" runat="server" Text="Edit" CommandName="EditData" CommandArgument='<%#Eval("Id")%>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                    </asp:GridView> </td>
           </tr>
    </table>
       </center>
    
</asp:Content>
