declare module '@khorark/react-native-app-metrica' {
    interface IActivationConfig {
        apiKey: string;
        sessionTimeout?: number;
        firstActivationAsUpdate?: boolean;
    }

    export default class AppMetrica {
        /**
         * Starts the statistics collection process.
         * @param APP_METRIC_KEY
         */
        public static activateWithApiKey(APP_METRIC_KEY: string): never;

        /**
         * Starts the statistics collection process using config.
         * @param params
         */
        public static activateWithConfig(params: IActivationConfig): never;

        /**
         * Sends a custom event message and additional parameters (optional).
         * @param message
         * @param params
         */
        public static reportEvent(message: string, params?: object): never;

        /**
         * Sends error with reason.
         * @param e
         * @param reason
         */
        public static reportError(e: string, reason: object): never;

        public static setUserProfileID(userProfileId: string): never;
        private static AppMetrica;
    }
}
