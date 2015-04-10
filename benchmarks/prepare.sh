mkdir jruby
cd jruby
git clone git@github.com:jruby/jruby.git optimized
cp -R optimized unoptimized
cd optimized
git checkout e792a66f1e4a8fd3b21ab73b08cbb4fbfe38a484
echo "Building JRuby with kwargs optimization enabled..."
mvn
cd ../unoptimized
git checkout 9505d0e517e04efe35562225b075766bd94a38b6
echo "Disabling kwargs optimization"
sed -i.bak 's/(dispatchHead.getFirstDispatchNode().couldOptimizeKeywordArguments() && !cannotOptimize)/(false)/g' truffle/src/main/java/org/jruby/truffle/nodes/RubyCallNode.java
echo "Building JRuby without kwargs optimization..."
mvn
echo "All done. You may now execute run.sh."