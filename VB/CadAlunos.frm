Private Sub btnLimparC_Click()
txtProcurar.Text = ""
txtCPF.Text = ""
txtNome.Text = ""
txtEmail.Text = ""
txtTel.Text = ""
End Sub

Private Sub btnVoltar_Click()
Unload Me
TipodeCadastro.Show
End Sub

Private Sub Command1_Click()
Dim ManiBD As ADODB.Recordset
Dim strsql As String
strsql = "insert into alunos (CPF, Nome, Tel, Email, Senha) values (" _
& "'" & txtCPF.Text & "'," _
& "'" & txtNome.Text & "'," _
& "'" & txtTel.Text & "'," _
& "'" & txtEmail.Text & "'," _
& "'" & txtSenha.Text & "')"
Set ManiBD = cn.Execute(strsql)
Set ManiBD = Nothing
MsgBox "Inserido com Sucesso"
Me.buscardadosListView
txtCPF.Text = ""
txtNome.Text = ""
txtTel.Text = ""
txtEmail.Text = ""
End Sub
Sub buscardadosListView()
strsql = "select * from alunos"
Set ManiBD = cn.Execute(strsql)
ListView1.ListItems.Clear
Do While Not ManiBD.EOF
Set Item = ListView1.ListItems.Add(, , ManiBD!CPF)
Item.SubItems(1) = ManiBD!Nome & ""
Item.SubItems(2) = ManiBD!Tel & ""
Item.SubItems(3) = ManiBD!Email & ""
Item.SubItems(4) = ManiBD!Senha & ""
ManiBD.MoveNext
Loop
Set ManiBD = Nothing
End Sub

Private Sub Command2_Click()
Dim strsql As String
Dim ManiBD As ADODB.Recordset
strsql = "update alunos set Nome='" & txtNome.Text & "'," _
& "Tel='" & txtTel.Text & "'," _
& "Email='" & txtEmail.Text & "'," _
& "Senha='" & txtSenha.Text & "'" _
& "where CPF='" & txtCPF.Text & "'"
Set ManiBD = cn.Execute(strsql)
Set ManiBD = Nothing
MsgBox "Registro Atualizado"
Me.buscardadosListView
txtCPF.Text = ""
txtNome.Text = ""
txtTel.Text = ""
txtEmail.Text = ""
End Sub

Private Sub Command3_Click()
Dim ManiBD As ADODB.Recordset
Dim strsql As String
strsql = "delete from alunos where CPF='" & txtCPF.Text & "'"
Set ManiBD = cn.Execute(strsql)
Set ManiBD = Nothing
MsgBox "Registro Deletado!"
Me.buscardadosListView
txtCPF.Text = ""
txtNome.Text = ""
txtTel.Text = ""
txtEmail.Text = ""
End Sub
'Comando de Procurar Dados e Inserir-los no ListView1
Private Sub Command4_Click()
strsql = "select * from alunos where CPF='" & txtProcurar.Text & "'"
Set ManiBD = cn.Execute(strsql)
ListView1.ListItems.Clear
Do While Not ManiBD.EOF
Set Item = ListView1.ListItems.Add(, , ManiBD!CPF)
Item.SubItems(1) = ManiBD!Nome & ""
Item.SubItems(2) = ManiBD!Tel & ""
Item.SubItems(3) = ManiBD!Email & ""
Item.SubItems(4) = ManiBD!Senha & ""
ManiBD.MoveNext
Loop
Set ManiBD = Nothing
ListView1.Refresh
End Sub

Private Sub Command5_Click()
ListView1.ListItems.Clear
End Sub

' Inicia o Metodo de Buscar Dados da Tabela Alunos e carregar no ListView1
Private Sub Form_Load()
Me.buscardadosListView
End Sub

Private Sub ListView1_ItemClick(ByVal Item As MSComctlLib.ListItem)
With Item
txtCPF.Text = Item
txtNome.Text = .SubItems(1)
txtTel.Text = .SubItems(2)
txtEmail.Text = .SubItems(3)
txtSenha.Text = .SubItems(4)
End With
End Sub

