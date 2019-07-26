# Criado em 29/10/2018
# Edilmar Canuto
# Faz o logoff em sessões remotas do windows.

    $user=Read-Host -Prompt 'Coloque seu login'
    $servers=(Get-Content C:\Users\TR345532\Desktop\PowerShell\servidores.txt)
    $arquivolog = New-Item -Path 'C:\Users\TR345532\Desktop\PowerShell_2\servidores_logoff.txt' -ItemType "file"
    $i=1

    foreach ($acesso in $servers){
        $error.clear()
	    $erroractionpreference = “SilentlyContinue”
        $sessionId = ((quser /server:$acesso | Where-Object { $_ -match $User }) -split ' +')[2]
        if (($sessionId -notlike "" ))   {
        
             write-output "Servidor $acesso, Possui sessão ativa com o ID = $sessionId "
             Write-Output "Deseja efetuar logoff"


    function Show-Menu
        {     
         Write-Host "`n Pressione '1' para fazer logoff." -ForegroundColor Blue
         Write-Host "`n Pressione '2' para sair. `n" -ForegroundColor Red

        }

        do
        {
         Show-Menu
         $input = Read-Host "`n Selecione uma opção"
         switch ($input)
         {
              '1' {
                    #cls
                    logoff $sessionId /server:$acesso
                    "Logoff efetuado `n" -ForegroundColor Green}

               '2' {
                    echo "logoff $sessionId /server:$acesso" >> $arquivolog

                    Write-Host "`n Continuando a verificação `n " -ForegroundColor Green

               }
         }
        }
        until ($input)

    
 
    }

        else {
                
            Write-Output "Servidor $acesso, sem sessão ativa "
             }
     
        }
  