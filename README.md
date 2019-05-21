# POC for tmob with Foursquare API

I have finished project. It still needs development/refactoring but _**time limit was shorter that usual**_.

I have used MVVM-Coordinator pattern except modal DetailVC. I still can do that but it could slow down the general development.

Challenges: 
- TransitionDelegate
- Get location without asking permission
- Fighting with Foursquare API.

Used libraries:
- Moya
- TinyConstraints (I am one of the contributors of this project)
- SwiftLocation (Not a big fan of this but still speeds things up)
- AlamofireImage

Splash Screen is waiting on purpose. It was one of the requirements. It is empty UIImageView because I couldn't get the assets. ¯\_(ツ)_/¯

Project support iOS 9.0. I think this is unnecessary but that was one of the requirements.

I hope you like it. Ask me anything about project. I am ready to answer your questions.

# Installation

Clone repo:
```bash
git clone git@github.com:onurgenes/tmob-poc.git
```

Install dependencies:
```bash
pod install
```

Run the `.xcworkspace`or shortcut:
```bash
xed .
```
