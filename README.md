# react-native-desk360-module

Unofficial Desk360 Bridge for React Native

## Installation

```sh
npm install react-native-desk360-module
```

## Usage

```js
import Desk360Module from "react-native-desk360-module";

// ...
// initilaize
//  targetId, pushtoken, name, email are optional you can send empty strings
// for version name you can use import 'deviceInfoModule' from react-native-device-info and use it const versionName = deviceInfoModule.getVersion();
Desk360Module.intialize('versionName' ,'YOUR DESK360 APP KEY', 'name', 'email', 'targetId', 'pushtoken', 'deviceId')

//show
Desk360Module.show()
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
