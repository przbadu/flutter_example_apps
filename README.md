# Flutter Expense UI

# Weather App

**Features:**

- Location and Weather model to searialize required attributes
- Location repository to find the latitude and longitude of the searching location
- weather repository to find the current weather of the searching location (using lat and lng found by location repository)
- weathers_controller to communicate between UI and repository using `StateNotifier`
- Pretty Basic UI with search box at the Appbar, and Result in the center of the body.


**Directory Structure**

```
lib                 
├───constants       
├───extensions      
├───models          
├───presentation    
│   ├───controllers 
│   └───screens     
└───repositories    
```

**packages**

- [http](https://pub.dev/packages/http) - package to make API calls to weather API: [api.open-meteo.com](https://open-meteo.com/en/docs)
- [flutter_riverpod](https://riverpod.dev/) - state management

![image](https://user-images.githubusercontent.com/4189129/190900625-118abc2b-e92b-41f1-a4c4-194b048ff568.png)
![image](https://user-images.githubusercontent.com/4189129/190900586-a9c68dc8-1b6e-457f-a698-fee35c96f2a2.png)
