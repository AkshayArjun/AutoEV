
onnx_agent = "evagent.onnx"

actorObj = getActor(agent);
actorNet = getModel(actorObj);

exportONNXNetwork(actorNet, onnx_agent)

analyzeNetwork(actorNet)