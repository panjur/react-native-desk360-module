import { NativeModules } from 'react-native';

type Desk360ModuleType = {
  multiply(a: number, b: number): Promise<number>;
  intialize(appVersionName: string, apiKey: string, userName: string, userEmail: string, targetId: string, pushToken: string, deviceId: string): Promise<number>;
  show(): Promise<number>;
};

const { Desk360Module } = NativeModules;

export default Desk360Module as Desk360ModuleType;
