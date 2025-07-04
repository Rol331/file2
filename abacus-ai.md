# 1) listar id de proyecto 

   curl "https://api.abacus.ai/api/listProjects" \
   -X GET \
   -H "apiKey: s2_007afa3adbab4e13b99fb0e6b9e9f02e"
   
--respuesta

    {
      "success": true,
      "result": [
        {
          "projectId": "1148839d8",
          "name": "chatllm-teams",
          "useCase": "CHAT_LLM",
          "problemType": "CHAT_LLM",
          "createdAt": "2024-09-10T23:37:12+00:00"
        }
      ]
 
# 2) Obtener id de sesión 

   curl "https://api.abacus.ai/api/createChatSession" \
   -X POST \
   -d 'projectId=1148839d8' \
   -H "apiKey: s2_007afa3adbab4e13b99fb0e6b9e9f02e"

--repuesta 

     {
       "success": true,
       "result": {
         "chatSessionId": "8dabc9192",
         "projectId": "1148839d8",
         "name": "chatllm-teams",
         "createdAt": "2024-09-20T15:23:50+00:00",
         "aiBuildingInProgress": false,
         "whiteboard": "",
         "chatHistory": []
       }
     }

#3) Obtener deployment tokens 

     curl "https://api.abacus.ai/api/v0/listDeploymentTokens?projectId=1148839d8" \
     -X GET \
     -H "apiKey: s2_007afa3adbab4e13b99fb0e6b9e9f02e"

  --respuesta 

    {
         "success": true,
         "result": [
           {
             "createdAt": "2024-09-10T23:37:12+00:00",
             "deploymentToken": "db415c7530984b368dc825265baec2fb"
           }
         ]
       }   
     
# 4) Obtener deployment id 

   curl "https://api.abacus.ai/api/v0/listDeployments?projectId=1148839d8" \
   -X GET \
   -H "apiKey: s2_007afa3adbab4e13b99fb0e6b9e9f02e"

 --respuesta 

      {
        "success": true,
        "result": [
          {
            "deploymentId": "f1d80e4dc",
            "name": "ChatLLM Deployment",
            "description": "",
            "createdAt": "2024-09-10T23:37:12+00:00",
            "modelId": "d17386336",
            "callsPerSecond": 5,
            "autoDeploy": false,
            "skipMetricsCheck": false,
            "algoName": "OpenAI GPT-4 128K Latest",
            "regions": [
              {
                "name": "Us West 2",
                "value": "us-west-2"
              }
            ],
            "batchStreamingUpdates": false,
            "algorithm": "d17386336",
            "modelDeploymentConfig": {
              "otherModelsForDataClusterTypes": {},
              "streamingFeatureGroupDetails": [],
              "modelTrainingType": null
            },
            "projectId": "1148839d8",
            "status": "STOPPED",
            "modelVersion": "db53225e0",
            "defaultPredictionArguments": {}
          },
          {
            "deploymentId": "f95ec3566",
            "name": "SearchLLM Deployment",
            "description": "",
            "createdAt": "2024-09-10T23:37:13+00:00",
            "modelId": "d17386336",
            "callsPerSecond": 5,
            "autoDeploy": false,
            "skipMetricsCheck": false,
            "algoName": "OpenAI GPT-4 128K Latest",
            "regions": [
              {
                "name": "Us West 2",
                "value": "us-west-2"
              }
            ],
            "batchStreamingUpdates": false,
            "algorithm": "d17386336",
            "modelDeploymentConfig": {
              "otherModelsForDataClusterTypes": {},
              "streamingFeatureGroupDetails": [],
              "modelTrainingType": null
            },
            "projectId": "1148839d8",
            "status": "STOPPED",
            "modelVersion": "db53225e0",
            "defaultPredictionArguments": {}
          }
        ]
      }
    
# 5) Obtener external Session id 

  curl "https://api.abacus.ai/api/v0/listDeploymentConversations?deploymentId=f95ec3566" \
  -X GET \
  -H "apiKey: s2_007afa3adbab4e13b99fb0e6b9e9f02e"
   
--respuesta 


{
  "success": true,
  "result": [
    {
      "deploymentConversationId": "5ed65766c",
      "name": "Google Backend Services",
      "deploymentId": "f95ec3566",
      "createdAt": "2024-09-13T15:24:30+00:00",
      "lastEventCreatedAt": "2024-09-13T15:25:07+00:00",
      "externalApplicationId": "7149ebe96",
      "conversationType": "CHATLLM"
    },
    {
      "deploymentConversationId": "13ca135a2f",
      "name": "UML Diagrams from DBML",
      "deploymentId": "f95ec3566",
      "createdAt": "2024-09-11T13:21:36+00:00",
      "lastEventCreatedAt": "2024-09-11T13:22:13+00:00",
      "externalApplicationId": "7149ebe96",
      "conversationType": "CHATLLM"
    },
    {
      "deploymentConversationId": "99b074ec8",
      "name": "Alternativa a Apollo en GraphQL",
      "deploymentId": "f95ec3566",
      "createdAt": "2024-09-11T13:10:49+00:00",
      "lastEventCreatedAt": "2024-09-11T13:10:56+00:00",
      "externalApplicationId": "7149ebe96",
      "conversationType": "CHATLLM"
    }
  ]
}

# Activar despligue 

  curl "https://api.abacus.ai/api/v0/startDeployment?deploymentId=f95ec3566" \
  -X GET \
  -H "apiKey: s2_007afa3adbab4e13b99fb0e6b9e9f02e"

 --respuesta 

{
  "success": true
}

# 7) Usar chat 

   curl "https://api.abacus.ai/api/executeConversationAgent?deploymentToken=db415c7530984b368dc825265baec2fb&deploymentId=f95ec3566" \
   -X POST \
   -H "apiKey: s2_007afa3adbab4e13b99fb0e6b9e9f02e" \
   -d 'arguments=["Hola"]' \
   -d 'keywordArguments={}' \
   -d 'externalSessionId="7149ebe96"'

##   ################

verificar external sesion id 
curl "https://api.abacus.ai/api/v0/listDeploymentConversations?deploymentId=f95ec3566" \
   -X GET \
   -H "apiKey: s2_007afa3adbab4e13b99fb0e6b9e9f02e"

Listar Tokens de Despliegue:
curl "https://api.abacus.ai/api/v0/listDeploymentTokens?projectId=1148839d8" \
   -X GET \
   -H "apiKey: s2_007afa3adbab4e13b99fb0e6b9e9f02e"

Listar Despliegues:
curl "https://api.abacus.ai/api/v0/listDeployments?projectId=1148839d8" \
   -X GET \
   -H "apiKey: s2_007afa3adbab4e13b99fb0e6b9e9f02e"
      
Verificar tokens 
 curl "https://api.abacus.ai/api/v0/listDeploymentTokens?projectId=1148839d8" \
      -X GET \
      -H "apiKey: s2_007afa3adbab4e13b99fb0e6b9e9f02e"  
