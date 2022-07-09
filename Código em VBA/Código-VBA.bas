Attribute VB_Name = "Módulo1"
Sub Exportar_Vendas_Combustivel_UF_produto_2000_2020()
'
' Macro1 Macro
'
'

For Each c In Worksheets("Plan1").Range("C54:W54")
    c.Select
    Selection.ShowDetail = True
    Sheets("Plan1").Select
    
Next c

Dim WS_Count As Integer
Dim I As Integer
       
    WS_Count = ActiveWorkbook.Worksheets.Count

    For I = 1 To WS_Count - 1
        ActiveWorkbook.Worksheets(I).Name = "Comb_" & I

    Next I

    
End Sub
Sub Exportar_Vendas_Diesel_Tipo_UF_produto_2013_2020()
'
' Macro1 Macro
'
'
For Each c In Worksheets("Plan1").Range("C134:J134")
    c.Select
    Selection.ShowDetail = True
    Sheets("Plan1").Select
Next c

Dim WS_Count As Integer
Dim I As Integer
Dim J As Integer

WS_Count = ActiveWorkbook.Worksheets.Count

For I = 22 To WS_Count - 1
    J = I - 21
    ActiveWorkbook.Worksheets(I).Name = "Diesel_" & J

Next I
   
    
End Sub
