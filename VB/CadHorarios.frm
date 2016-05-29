VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmCadHorarios 
   BackColor       =   &H80000003&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cadastro de Horário"
   ClientHeight    =   8025
   ClientLeft      =   -15
   ClientTop       =   375
   ClientWidth     =   7905
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8025
   ScaleWidth      =   7905
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btoCadHorCancelarHora 
      Caption         =   "Cancelar"
      Height          =   255
      Left            =   5880
      TabIndex        =   13
      Top             =   2760
      Width           =   1215
   End
   Begin VB.CommandButton btoCadHorVoltar 
      Caption         =   "Voltar"
      Height          =   375
      Left            =   6720
      TabIndex        =   12
      Top             =   120
      Width           =   975
   End
   Begin VB.TextBox txtHoraSelec 
      Height          =   375
      Left            =   5520
      TabIndex        =   10
      Top             =   4200
      Width           =   735
   End
   Begin MSComCtl2.MonthView MonthView1 
      Height          =   2370
      Left            =   360
      TabIndex        =   8
      Top             =   840
      Width           =   2490
      _ExtentX        =   4392
      _ExtentY        =   4180
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483645
      Appearance      =   1
      StartOfWeek     =   99876865
      CurrentDate     =   42513
   End
   Begin VB.TextBox txtDiaSelec 
      Height          =   375
      Left            =   4200
      TabIndex        =   7
      Top             =   4200
      Width           =   1215
   End
   Begin MSComctlLib.ListView ListView1 
      Height          =   3015
      Left            =   120
      TabIndex        =   5
      Top             =   4680
      Width           =   7575
      _ExtentX        =   13361
      _ExtentY        =   5318
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Data"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Hora"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Status"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Cadastrar Horario"
      Height          =   855
      Left            =   6360
      TabIndex        =   4
      Top             =   3720
      Width           =   1335
   End
   Begin VB.CheckBox C16h 
      BackColor       =   &H80000003&
      Caption         =   "16:00hs"
      Height          =   495
      Left            =   5880
      TabIndex        =   3
      Top             =   2160
      Width           =   1215
   End
   Begin VB.CheckBox C13h 
      BackColor       =   &H80000003&
      Caption         =   "13:00hs"
      Height          =   495
      Left            =   5880
      TabIndex        =   2
      Top             =   1560
      Width           =   1215
   End
   Begin VB.CheckBox C10h 
      BackColor       =   &H80000003&
      Caption         =   "10:00hs"
      Height          =   495
      Left            =   5880
      TabIndex        =   1
      Top             =   960
      Width           =   1215
   End
   Begin VB.Label Label4 
      BackColor       =   &H80000003&
      Caption         =   "Hora"
      Height          =   255
      Left            =   5520
      TabIndex        =   11
      Top             =   3840
      Width           =   735
   End
   Begin VB.Label Label3 
      BackColor       =   &H80000003&
      Caption         =   "Dia Selecionado"
      Height          =   255
      Left            =   4200
      TabIndex        =   9
      Top             =   3840
      Width           =   1215
   End
   Begin VB.Label Label2 
      BackColor       =   &H80000003&
      Caption         =   "Horarios Cadastrados"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   4200
      Width           =   2055
   End
   Begin VB.Image imgCadHorRelogio 
      Height          =   2055
      Left            =   3600
      Picture         =   "CadHorarios.frx":0000
      Stretch         =   -1  'True
      Top             =   960
      Width           =   2175
   End
   Begin VB.Label Label1 
      BackColor       =   &H80000003&
      Caption         =   "Selecione O Dia e a Hora que deseja cadastrar"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   1560
      TabIndex        =   0
      Top             =   120
      Width           =   4815
   End
End
Attribute VB_Name = "frmCadHorarios"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btoCadHorCancelarHora_Click()
    C10h.Value = 0
    C13h.Value = 0
    C16h.Value = 0
    C10h.Enabled = True
    C13h.Enabled = True
    C16h.Enabled = True
End Sub

Private Sub btoCadHorVoltar_Click()
    Unload Me
    TipodeCadastro.Show
End Sub

Private Sub C10h_Click()
    txtHoraSelec.Text = "10:00"
    C13h.Enabled = False
    C16h.Enabled = False
End Sub

Private Sub C13h_Click()
    txtHoraSelec.Text = "13:00"
    C10h.Enabled = False
    C16h.Enabled = False
End Sub

Private Sub C16h_Click()
    txtHoraSelec.Text = "16:00"
    C13h.Enabled = False
    C10h.Enabled = False
End Sub

Private Sub Command1_Click()
    Me.InserirData
    'Me.InserirHora
    MsgBox "Inserido com Sucesso"
End Sub

Sub InserirData()

Dim ManiBD As ADODB.Recordset
Dim strsql As String
strsql = "insert into horarios (Data) values (" _
& "'" & txtDiaSelec.Text & "')"
Set ManiBD = cn.Execute(strsql)
Set ManiBD = Nothing
End Sub

Sub InserirHora()
    Dim ManiBD As ADODB.Recordset
    Dim strsql As StringN
    strsql = "update horarios Set Hora =  where Data=" _
    & "'" & txtDiaSelec.Text '"
    Set ManiBD = cn.Execute(strsql)
    Set ManiBD = Nothing
End Sub

Private Sub Command2_Click()
    Unload Me
    TipodeCadastro.Show
End Sub

Private Sub Form_Load()
    Me.buscardordedadosListView
End Sub

Private Sub MonthView1_DateClick(ByVal DateClicked As Date)
    txtDiaSelec = MonthView1.Value
End Sub

Sub buscardordedadosListView()
    strsql = "Select * from horarios"
    Set ManiBD = cn.Execute(strsql)
    ListView1.ListItems.Clear
    Do While Not ManiBD.EOF
        Set Item = ListView1.ListItems.Add(, , ManiBD!Hora)
        Item.SubItems(1) = ManiBD!Hora & ""
        Item.SubItems(2) = ManiBD!Status & ""
        ManiBD.MoveNext
    Loop
    Set ManiBD = Nothing
End Sub




