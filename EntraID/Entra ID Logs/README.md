# Entra ID logs

Logs from Entra ID can be sent to a Log Analytics Workspace, Event Hubs, Storage Account, etc. Please see log types below:

- AuditLogs
- SignInLogs
- NonInteractiveUserSignInLogs
- ServicePrincipalSignInLogs
- ManagedIdentitySignInLogs
- ProvisioningLogs
- ADFSSignInLogs
- RiskyUsers
- UserRiskEvents
- NetworkAccessTrafficLogs
- RiskyServicePrincipals
- ServicePrincipalRiskEvents
- EnrichedOffice365AuditLogs
- MicrosoftGraphActivityLogs
- RemoteNetworkHealthLogs
- NetworkAccessAlerts
- NetworkAccessConnectionEvents
- MicrosoftServicePrincipalSignInLogs
- AzureADGraphActivityLogs


## Activity reporting

Entra ID keeps reporting of certain logs for a set time depending on your Entra ID licence. Please see below for more information.

| Report                                             | Microsoft Entra ID Free | Microsoft Entra ID P1                  | Microsoft Entra ID P2                  |
|----------------------------------------------------|------------------------|----------------------------------------|----------------------------------------|
| Audit logs                                         | Seven days             | 30 days                                | 30 days                                |
| Sign-ins                                           | Seven days             | 30 days                                | 30 days                                |
| Microsoft Entra multifactor authentication usage   | 30 days                | 30 days                                | 30 days                                |
| Microsoft Graph activity logs*                     | NA                     | Must be integrated with storage or analytics tools | Must be integrated with storage or analytics tools |