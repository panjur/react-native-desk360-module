import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import Desk360Module from 'react-native-desk360-module';

export default function App() {
  const [result, setResult] = React.useState<number | undefined>();

  React.useEffect(() => {
    Desk360Module.multiply(3, 7).then(setResult);
    Desk360Module.intialize('AmirD', 'string@123', '123', 'string', 'string')
    Desk360Module.show()
  }, []);

  return (
    <View style={styles.container}>
      <Text>Result: {result}</Text>
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
