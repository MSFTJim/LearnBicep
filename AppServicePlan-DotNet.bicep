// param webAppName string = uniqueString(resourceGroup().id) // Generate unique String for web app name
param webAppName string = 'myBicepAppSrv'
param sku string = 'F1' // The SKU of App Service Plan
param linuxFxVersion string = 'DOTNETCORE|7' // The runtime stack of web app
param location string = resourceGroup().location // Location for all resources
param repositoryUrl string = 'https://github.com/Azure-Samples/nodejs-docs-hello-world'
param branch string = 'main'
var appServicePlanName = toLower('AppServicePlan-${webAppName}')
// var webSiteName = toLower('wapp-${webAppName}')
var webSiteName = 'myBicepApp'
resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: sku
  }
  kind: 'linux'
}
resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webSiteName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
      // appCommandLine: 'dotnet MyApp.dll'
    }
  }
}
// resource srcControls 'Microsoft.Web/sites/sourcecontrols@2021-01-01' = {
//   name: '${appService.name}/web'
//   properties: {
//     repoUrl: repositoryUrl
//     branch: branch
//     isManualIntegration: true
//   }
// }