
# rn-app-metrica

## Getting started

`$ npm install rn-app-metrica --save`

### Mostly automatic installation

`$ react-native link rn-app-metrica`

#### For iOS
1. In XCode, in the project navigator, select your project. Removed `libRNAppMetrica.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
2. Add in your Podfile 
`pod 'RNAppMetrica', :path => '../node_modules/rn-app-metrica'`
3. Run `pod install`

### Manual installation


#### iOS

1. Add in your Podfile 
`pod 'RNAppMetrica', :path => '../node_modules/rn-app-metrica'`
2. Run `pod install`


#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNAppMetricaPackage;` to the imports at the top of the file
  - Add `new RNAppMetricaPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':rn-app-metrica'
   project(':rn-app-metrica').projectDir = new File(rootProject.projectDir, '../node_modules/rn-app-metrica/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
   implementation project(':rn-app-metrica')
  	```

## Usage
```javascript
import AppMetrica from 'rn-app-metrica';

// For activated metric
AppMetrica.activateWithApiKey(key);

// For send event
AppMetrica.reportEvent(key, params?);
```
  