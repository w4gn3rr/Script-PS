﻿$Nome = Read-Host "Digite o somente o nome de rede do usuario:"
$Dominio = "@dominio.com.br"
$Usuario = $Nome + $Dominio
Write-Host  "Verificando dados do(a) usuario(a) $Usuario"
Get-MSOlUser  -UserPrincipalName "$Usuario"  | Select-Object CloudExchangeRecipientDisplayType , UserPrincipalName, DisplayName, LastName, LastPasswordChangeTimestamp, @{Name=”DuracaodaSenha”;Expression={(Get-Date)-$_.LastPasswordChangeTimeStamp}}, ValidationStatus   , WhenCreated    , BlockCredential, PasswordNeverExpires, PasswordResetNotRequiredDuringActivate , LicenseReconciliationNeeded  , StrongPasswordRequired       , StsRefreshTokensValidFrom    ,  Licenses , ObjectId , Office , OverallProvisioningStatus , PreferredLanguage  , ProxyAddresses , LicenseAssignmentDetails , SignInName     , Title, UsageLocation  , UserLandingPageIdentifierForO365Shell  , UserThemeIdentifierForO365Shell , UserType , City 
teste 2