if [ ! -d jruby ]
then
    echo "Please execute prepare.sh first."
    exit 1
fi

echo ""
echo "------------------------------------------------------------------------"
echo "kwargs1.rb (1 target: 10 kwargs) [unoptimized]"
echo "------------------------------------------------------------------------"
jruby/unoptimized/bin/jruby.sh -X+T kwargs1.rb
echo ""
echo "------------------------------------------------------------------------"
echo "kwargs1.rb (1 target: 10 kwargs) [optimized]"
echo "------------------------------------------------------------------------"
jruby/optimized/bin/jruby.sh -X+T kwargs1.rb
echo ""
echo "------------------------------------------------------------------------"
echo "kwargs2.rb (2 targets: 10 kwargs; 10 kwargs) [unoptimized]"
echo "------------------------------------------------------------------------"
jruby/unoptimized/bin/jruby.sh -X+T kwargs2.rb
echo ""
echo "------------------------------------------------------------------------"
echo "kwargs2.rb (2 targets: 10 kwargs; 10 kwargs) [optimized]"
echo "------------------------------------------------------------------------"
jruby/optimized/bin/jruby.sh -X+T kwargs2.rb
echo ""
echo "------------------------------------------------------------------------"
echo "kwargs3.rb (2 targets: 10 kwargs; 5 kwargs + rest kwargs) [unoptimized]"
echo "------------------------------------------------------------------------"
jruby/unoptimized/bin/jruby.sh -X+T kwargs3.rb
echo ""
echo "------------------------------------------------------------------------"
echo "kwargs3.rb (2 targets: 10 kwargs; 5 kwargs + rest kwargs) [optimized]"
echo "------------------------------------------------------------------------"
jruby/optimized/bin/jruby.sh -X+T kwargs3.rb
echo ""
echo "------------------------------------------------------------------------"
echo "kwargs4.rb (1 target: 5 kwargs + rest kwargs) [unoptimized]"
echo "------------------------------------------------------------------------"
jruby/unoptimized/bin/jruby.sh -X+T kwargs4.rb
echo ""
echo "------------------------------------------------------------------------"
echo "kwargs4.rb (1 target: 5 kwargs + rest kwargs) [optimized]"
echo "------------------------------------------------------------------------"
jruby/optimized/bin/jruby.sh -X+T kwargs4.rb