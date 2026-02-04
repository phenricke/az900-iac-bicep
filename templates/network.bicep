param location string = 'northcentralus'

@description('Nome da VNet já criada pela VM')
param vnetName string = 'vm-az900-iac-vnet'

@description('Nome da subnet já criada pela VM')
param subnetName string = 'default'

resource nsg 'Microsoft.Network/networkSecurityGroups@2022-07-01' = {
  name: 'nsg-az900-iac-bicep'
  location: location
  properties: {
    securityRules: [
      {
        name: 'Allow-RDP'
        properties: {
          priority: 100
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'Allow-SSH'
        properties: {
          priority: 200
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}

resource subnetWithNsg 'Microsoft.Network/virtualNetworks/subnets@2022-07-01' = {
  name: '${vnetName}/${subnetName}'
  properties: {
    addressPrefix: '10.0.0.0/24'
    networkSecurityGroup: {
      id: nsg.id
    }
  }
}
