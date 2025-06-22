# ARM TEmplates

ARM Templates must consist of the following things:

- Schema (aka $schema)

- Resources, This is where you declare your resources. The resources field requires the following things. Resource must be declared in squared brackets [].
    - Resource Type. This is labelled "type". This will be the resource that you would like to deploy.
    - apiVersion. This is ARM API in which to interact with.
    - name. This is the name of the resource.

- Paramaters, this makes the template re-useable. Parameters are called out within the JSON config template. You can insert allowed values to ensure that the code remains in governance. 

- Functions add flexibility to your template by dynamically getting values during deployment. An example of a function is getting a location based on the RG during the deployment. 


```json
    "location": {
      "type": "string",
      "defaultValue": "[resourceGroup().location]"
    }
```

- Variables, These are used to have a single point where information is declared rather than repeating that value all the way through a template.

- Outputs, outputs are used to output different information about what you deployed. Outputs use the reference function of ARM templates. 

- Tags, Tags can be deployed within an ARM template. This is treated as an object within paramaters and then declared within the resouce you want to deploy the tags too.

## How to deploy ARM template with CLI or PowerShell

### Azure CLI

```bash
templateFile=".\azuredeploy.json"
az deployment group create \
  --name blanktemplate \
  --resource-group myResourceGroup \
  --template-file $templateFile
```

### PowerShell

```powershell
$templateFile = ".\azuredeploy.json"
New-AzResourceGroupDeployment -Name blanktemplate -ResourceGroupName myResourceGroup -TemplateFile $templateFile
```

## How to deploy ARM template with CLI or PowerShell with paramaters

### Azure CLI

```bash
templateFile=".\azuredeploy.json"
az deployment group create --name usenondefaultsku --resource-group myResourceGroup --template-file $templateFile --parameters storageSKU=Standard_GRS storageName={your-unique-name}
```

### PowerShell

```powershell
New-AzResourceGroupDeployment -Name usenondefaultsku -ResourceGroupName myResourceGroup -TemplateFile $templateFile -storageName "{your-unique-name}" -storageSKU Standard_GRS
```

## How to deploy ARM template with CLI or PowerShell with paramaters file

Paramaters file can be added for deployments when there are alot of parameters. These can be then declared in the PowerShell or Azure CLI. 

### Azure CLI

```bash
templateFile=".\azuredeploy.json"
az deployment group create --name usenondefaultsku --resource-group myResourceGroup --template-file $templateFile --parameters storageSKU=Standard_GRS storageName={your-unique-name} --template-file $templateFile 
```

### PowerShell

```powershell
New-AzResourceGroupDeployment -Name usenondefaultsku -ResourceGroupName myResourceGroup -TemplateFile $templateFile -storageName "{your-unique-name}" -storageSKU Standard_GRS     -TemplateParameterFile $parameterFile
```


## Quick start templates 

Azure Quickstart Templates is a repository of community contributed templates. You can use the sample templates in your template development.

## Deployment options

You can deploy ARM templates to the Tenant level, Management group level, subscription level and RG level.
