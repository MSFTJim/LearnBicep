param location string = 'eastus'

@minLength(3)
@maxLength(24)
param storageAccountName string = 'sa1bicep' // must be globally unique

var storageSku = 'Standard_LRS' // declare variable and assign value



resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageAccountName
  location: location
  kind: 'Storage'
  sku: {
    name: storageSku
  }
}

output storageId string = stg.id // output resourceId of storage account
