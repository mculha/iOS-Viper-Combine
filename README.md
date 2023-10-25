# iOS-Viper-Combine

![Viper](https://github.com/mculha/iOS-Viper-Combine/assets/20414142/36de6df3-a016-4327-b385-db3320820548)

**VIPER** is shortened to **View**, **Interactor**, **Presenter**, **Entity** and **Router** representing a clean architectural pattern.

The architecture is based on Single Responsibility Principle, leading to a clean architecture. It is designed to be scalable and modular, with each component serving a specific purpose.

<ins>**View**</ins>: The view is responsible for sending the user actions to the presenter and showing whatever the presenter tells it.

<ins>**Interactor**</ins>: This is the backbone of an application as it contains business logic.

<ins>**Presenter**</ins>: Its responsibility is to get the data from the interactor on user actions and after getting data from the interactor, it sends it to the view to show it. It also asks the router/wireframe for navigation.

<ins>**Entity**</ins>: It contains basic model objects used by the Interactor.

<ins>**Router**</ins>: It has all the navigation logic for describing which screens are to be shown and when. It is normally written as a wireframe.
