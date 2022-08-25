<h2 class="code-line" data-line-start=0 data-line-end=1 ><a id="Performancebenchmarks_0"></a>Performance-benchmarks</h2>
<p class="has-line-data" data-line-start="2" data-line-end="5">The idea of this repo is to create couple of benchmarks for obtaining some technical data about platform.<br>
The C language was chosen for writing the benchmarks due to its proximity to hardware and popularity.<br>
Benchmarks are designed for terminal version of execution. Is also possible to connect to remote server using SSH.</p>
<p class="has-line-data" data-line-start="6" data-line-end="7">Make sure that you have installed gcc compiler. I recomend to use Linux because of comfort of use and availability of interesting options.</p>
<h2 class="code-line" data-line-start=8 data-line-end=9 ><a id="_latency_scalarc__8"></a><em>latency_scalar.c</em></h2>
<p class="has-line-data" data-line-start="9" data-line-end="10">This is benchmark for obtaining latency value. Latency is time for execution single scalar operation. Due to data dependencies  it’s not using pipelining. If you need, for better understanding read about pipelining and superscalar processing 😊</p>
<p class="has-line-data" data-line-start="11" data-line-end="12">Compile code using high optimization, eg</p>
<pre><code class="has-line-data" data-line-start="13" data-line-end="15" class="language-sh">gcc -O3 latency_scalar.c -o latency_scalar
</code></pre>
<p class="has-line-data" data-line-start="15" data-line-end="16">and run the program</p>
<pre><code class="has-line-data" data-line-start="17" data-line-end="19" class="language-sh">./latency_scalar
</code></pre>
<p class="has-line-data" data-line-start="19" data-line-end="20"><img src="https://user-images.githubusercontent.com/93876013/186651056-25dba351-f87f-4b3d-b2c9-5825ce6993af.png" alt="image"></p>
<p class="has-line-data" data-line-start="21" data-line-end="22">Quite interesting thing in this (and not only) code is warm up part. Contemporary computers are “smart”. To reduce power consumption processor decreases clock frequency. So when we start intense calculations CPU increases its frequency. During code execution. So performance decreases. Check it on your own by commenting warm up loop in code, recompile and execute both versions under perf stat tool.</p>
<pre><code class="has-line-data" data-line-start="23" data-line-end="25" class="language-sh">perf <span class="hljs-built_in">stat</span> ./latency_scalar
</code></pre>
