
# react-native-app-metrica

## Getting started

`$ npm install react-native-app-metrica --save`

### Mostly automatic installation

`$ react-native link react-native-app-metrica`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-app-metrica` and add `RNAppMetrica.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNAppMetrica.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNAppMetricaPackage;` to the imports at the top of the file
  - Add `new RNAppMetricaPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-app-metrica'
  	project(':react-native-app-metrica').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-app-metrica/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-app-metrica')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNAppMetrica.sln` in `node_modules/react-native-app-metrica/windows/RNAppMetrica.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using App.Metrica.RNAppMetrica;` to the usings at the top of the file
  - Add `new RNAppMetricaPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNAppMetrica from 'react-native-app-metrica';

// TODO: What to do with the module?
RNAppMetrica;
```
  