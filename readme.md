# AZ-900 IaC com Bicep

Este projeto demonstra o provisionamento e o monitoramento de uma máquina virtual no Azure utilizando Infrastructure as Code (IaC) com Bicep.  
Os templates estão organizados em três arquivos principais:

- vm.bicep: criação da máquina virtual  
- network.bicep: configuração de rede (VNet, Subnet, NSG, IP público)  
- monitoring.bicep: configuração de alertas (CPU e eventos administrativos)  

---

## Estrutura do Projeto

```
az900-iac-bicep/
├── templates/
│   ├── network.bicep
│   ├── vm.bicep
│   └── monitoring.bicep
├── README.md
```

---

## Pré-requisitos

- Azure CLI instalado  
- Bicep atualizado  

```bash
az bicep upgrade
```

- Resource Group existente  

```bash
az group create --name RG-az900-iac-bicep --location northcentralus
```

---

## Templates

### Rede

Provisiona os recursos de conectividade:

- Virtual Network (VNet)  
- Subnet  
- Network Security Group (NSG) com regras básicas  
- IP público  
- Network Interface (NIC)  

---

### Máquina Virtual

Provisiona a VM com os seguintes parâmetros:

- Sistema operacional: Ubuntu  
- Usuário administrador definido por parâmetro  
- Senha definida como parâmetro seguro  
- Associação com NIC e IP público  

---

### Monitoramento

Configura alertas de observabilidade:

- Metric Alert: uso de CPU acima de 80%  
- Activity Log Alert: eventos administrativos (start, stop, restart, delete)  

---

## Deploy

### Rede

```bash
az deployment group create \
  --resource-group RG-az900-iac-bicep \
  --template-file ./templates/network.bicep
```

### Máquina Virtual

```bash
az deployment group create \
  --resource-group RG-az900-iac-bicep \
  --template-file ./templates/vm.bicep
```

### Monitoramento

```bash
az deployment group create \
  --resource-group RG-az900-iac-bicep \
  --template-file ./templates/monitoring.bicep
```

---

## Monitoramento

- CPU Alert: dispara quando a utilização média de CPU for superior a 80% em 5 minutos  
- Activity Log Alert: dispara em operações administrativas da VM  

---

## Referências

- Documentação oficial do Bicep  
- Azure Monitor Alerts  
- Activity Log Alerts  
