param location string = 'global'
param rgName string = 'RG-az900-iac-bicep'

resource vmAllEventsAlert 'Microsoft.Insights/activityLogAlerts@2020-10-01' = {
  name: 'alert-vm-all-events'
  location: location
  properties: {
    scopes: [
      resourceId('Microsoft.Resources/resourceGroups', rgName)
    ]
    enabled: true
    condition: {
      allOf: [
        {
          field: 'category'
          equals: 'Administrative'
        }
        {
          field: 'operationName'
          equals: 'Microsoft.Compute/virtualMachines/start/action'
        }
        {
          field: 'operationName'
          equals: 'Microsoft.Compute/virtualMachines/deallocate/action'
        }
        {
          field: 'operationName'
          equals: 'Microsoft.Compute/virtualMachines/restart/action'
        }
        {
          field: 'operationName'
          equals: 'Microsoft.Compute/virtualMachines/delete'
        }
        {
          field: 'status'
          equals: 'Succeeded'
        }
      ]
    }
    actions: {
      actionGroups: []
    }
  }
}
