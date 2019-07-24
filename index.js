
import { NativeModules } from 'react-native';

const { RNAppMetrica } = NativeModules;

export default class AppMetrica {
    static activateWithApiKey(key) {
        RNAppMetrica.activateWithApiKey(key);
    }

    static activateWithConfig(key, params) {
        RNAppMetrica.activateWithConfig(key, params);
    }

    static reportEvent(message, params) {
        RNAppMetrica.reportEvent(message, params);
    }
}
