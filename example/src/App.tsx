import * as React from 'react';

import { StyleSheet, View, Button } from 'react-native';
import Desk360Module from 'react-native-desk360-module';

export default function App() {
  React.useEffect(() => {
    Desk360Module.intialize('YOUR DESK360 APP KEY', 'Amir Doreh', 'string@123', '123', 'string', 'string')
  }, []);

  return (
    <View style={styles.container}>
      {/* <Text>Result: {result}</Text> */}
      <Button title="Show Desk360" onPress = {() => 
        Desk360Module.show()
        }></Button>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
