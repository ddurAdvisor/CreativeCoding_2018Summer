# Arduino教程：第四天
今天我们来尝试一下其他的传感器和显示器（温度传感器和数码管）
## 实验一：Arduino制作感温杯电路
实验电路：

![arduino-day5-1-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter5/image/arduino-day5-1-The-experimental-circuit.png)

实际电路：

![arduino-day5-2-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter5/image/arduino-day5-2-The-experimental-circuit.png)

- 程序代码：
作用:依据温度显示水杯制作同等功能的电路程序

```
*/
 
void setup() {
  pinMode(13, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(11, OUTPUT);
}
void loop() {
  int vol = analogRead(A0) * (5.0 / 1023.0*100);             //读取LM35温度值
if (vol<=31)                                               //低温区的温度值设置、以及led显示
{
  digitalWrite(13, HIGH);
  digitalWrite(12, LOW);
  digitalWrite(11, LOW);
}
else if (vol>=32 && vol<=40)                              //中温区温度范围设置  &&为“与”的意思，具体请查阅wiki
{
   digitalWrite(13, LOW);
  digitalWrite(12, HIGH);
  digitalWrite(11, LOW);
}
else if (vol>=41)                                           //高温区温度设置
{
   digitalWrite(13, LOW);
  digitalWrite(12, LOW);
  digitalWrite(11, HIGH);
}
 
}

```

- 扩展：学习温度传感器的代码知识









## 实验二：Arduino驱动数码管
数码管就是一堆led通过共阳并联在一起的小方块，用来显示数字和几个字母，是非常简单常见的显示器件。和学习笔记中的数码管代码不同，这次使用的代码单位时间只亮一个数码管上的灯，肉眼看到的1,2,3是因为高刷新率，大于肉眼分辨速度，使得肉眼看到1,2,3等。这样的好处是亮度高，而且亮度均匀。
实验电路：

![arduino-day5-3-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter5/image/arduino-day5-3-The-experimental-circuit.png)

实际电路：

![arduino-day5-4-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter5/image/arduino-day5-4-The-experimental-circuit.png)

- 元器件：数码管、导线、电阻
- 程序代码：

```
作用:arduino驱动数码管循环显示0,1,2,3,4几个数字
*/
 
void setup() {  
 
	 pinMode(13,OUTPUT);     //激活13号引脚，我们需要用它供电             
 
	for(int n=2;n<=9;n++)
   {
   pinMode(n,OUTPUT);
   }
}
 
 
void loop() 
{
 
digitalWrite(13,1); //这个就是HIGH  和LOW 的另一种写法  0代表LOW   1代表HIGH
 
 
  /*==========显示0=============*/  
int n0[8]={0,0,0,0,0,0,1,1};       //定义数组 通过0，1定义各数码管的明灭，
  int z=0;
  for(int x=2;x<=9;x++)          //采用循环方式依次点亮指定的数码管led（数组中0为点亮），单位时间只点亮1个led
  {
	digitalWrite(x,n0[z]);         //点亮led语句  X为引脚数  n0[z]为数组z为0-8的变量，来依次读取数组中的值
	z++;
	if (z>=9)                    //防止变量z累加超过了8
	z=0;
  }
  delay(1000);
/*==========显示1=============*/  
int n1[8]={1,0,0,1,1,1,1,1};
  z=0;
  for(int x=2;x<=9;x++)
  {
	digitalWrite(x,n1[z]);
	z++;
	if (z>=9)
	z=0;
  }
  delay(1000);
/*==========显示2=============*/  
 int n2[8]={0,0,1,0,0,1,0,1};
  z=0;
  for(int x=2;x<=9;x++)
  {
	digitalWrite(x,n2[z]);
	z++;
	if (z>=9)
	z=0;
  } 
delay(1000);  
/*==========显示3=============*/  
 int n3[8]={0,0,0,0,1,1,0,1};
  z=0;
  for(int x=2;x<=9;x++)
  {
	digitalWrite(x,n3[z]);
	z++;
	if (z>=9)
	z=0;
  } 
delay(1000);  
/*==========显示4=============*/  
 int n4[8]={1,0,0,1,1,0,0,1};
 z=0;
  for(int x=2;x<=9;x++)
  {
	digitalWrite(x,n4[z]);
	z++;
	if (z>=9)
	z=0;
  } 
delay(1000); 
}

```

- 拓展：自己尝试显示10种数字

- 扩展实验：红外遥控器

实验电路：

![arduino-day5-5-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter5/image/arduino-day5-5-The-experimental-circuit.png)

实际电路：

![arduino-day5-6-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter5/image/arduino-day5-6-The-experimental-circuit.png)

- 程序代码：

```
#include <IRremote.h>  // 使用IRRemote函数库
 
const int irReceiverPin = 2;  // 红外接收器的 OUTPUT 引脚接在 PIN2 接口 定义irReceiverPin变量为PIN2接口
 
IRrecv irrecv(irReceiverPin); // 设置irReceiverPin定义的端口为红外信号接收端口
decode_results results;    // 定义results变量为红外结果存放位置
 
void setup()
{
  Serial.begin(9600);   // 开启串口，波特率为9600
  irrecv.enableIRIn();   // 启动红外解码
}
 
void loop() 
{
  if (irrecv.decode(&results)) {   // 解码成功，把数据放入results变量中
	// 把数据输入到串口
	Serial.print("irCode: ");            
	Serial.print(results.value, HEX); // 显示红外编码
	Serial.print(",  bits: ");           
	Serial.println(results.bits); // 显示红外编码位数
	irrecv.resume();    // 继续等待接收下一组信号
  }  
  delay(600); //延时600毫秒，做一个简单的消抖
}

```

- 打开串口监视器，波特率设置为9600，使用遥控器对着红外头按下按键，串口监视器上就会出来当前按键的红外编码与位数。


## 实验三：用蜂鸣器模拟音乐
蜂鸣器除了做警报之外，还可以制作成更加精细的音乐效果。
- 实验电路：

![arduino-day4-3-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter4/image/arduino-day4-3-The-experimental-circuit.png)

- 元器件：蜂鸣器、导线

首先讲下简单的乐理知识，知道音乐是怎么演奏出来的自然就可以通过代码来进行编排了。
- 1.	演奏单音符  一首乐曲有若干音符组成，一个音符对应一个频率。我们知道到相对应的频率 让arduino输出到蜂鸣器 蜂鸣器就会放出相应的声音，这里有个表供大家参考：

![arduino-day4-4-list](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter4/image/arduino-day4-4-list.png)

- 音符的演奏时间  我们知道了音符是如何演奏出来的，下一步就是控制音符的演奏时间。每个音符都会播放一定的时间，这样才能构成一首优美的曲子，而不是生硬的一个调的把所有的音符一股脑的都播放出来。如何确定每个音符演奏的单位时间呢？
我们知道，音符节奏分为一拍、半拍、1/4拍、1/8拍，我们规定一拍音符的时间为1；半拍为0.5；1/4拍为0.25；1/8拍为0.125……，所以我们可以为每个音符赋予这样的拍子播放出来，音乐就成了。
- 我们看看如何将简谱翻译成对应频率和拍子。
以葫芦娃为例：

![arduino-day4-5-hulubaby](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter4/image/arduino-day4-5-hulubaby.png)

先看下左上角1=D这里，用的是D调，好那我们就看《音符频率表》中的D行（红色部分）
，
- 第一个音符是1 但上面有个点，所以对应的就是589，时间是一拍=1，
- 第二个音符6（没有点）就是495，时间也是一拍=1，
- 第三个音符5 即441，因为有下划线所以是半拍=0.5，
……以此类推
- 第四0这里要注意下，这里是没有声音，但是要是用频率0表示还是会有声音（这个不懂），所以我们用一个很高频率的声音，这样人耳听不到就达到了没有声音的效果，所以频率为-1。拍子=1拍
- 第五，再接着看到第一句歌词葫芦娃 这个娃的音是3—，这表示是两拍，后面每加一个“-”，表示拍子+1（1+1），本例中最多是加到4.
- 第六，第二句歌词葫芦娃这个娃，3•带个点，点的意思是去3的拍子的一半，即3•的拍子是1+0.5
- 第七，大家可能会问那弧线怎么表示，这在音乐中属于连音，我们要表示的话，可以稍微改下连音后面那个音的频率，比如减少或增加一些数值（需自己调试），这样表现会更流畅，但操作上更复杂了，本例没有做连音的处理，大家有兴趣可以自己调整下。
所以说了一大堆，规律就是时间上单个音符没有下划线，就是一拍（1），有下划线是半拍（0.5），两个下划线是四分之一拍（0.25），有“—”=前面音符的拍子+1；频率上就是按照音符是否带点，点在上还是在下到表中查找就可以了。
至此原理清楚，随便拿个简谱来我们都可以翻译成代码了。

程序代码：

```

#define NOTE_D0 -1
#define NOTE_D1 294
#define NOTE_D2 330
#define NOTE_D3 350
#define NOTE_D4 393
#define NOTE_D5 441
#define NOTE_D6 495
#define NOTE_D7 556

#define NOTE_DL1 147
#define NOTE_DL2 165
#define NOTE_DL3 175
#define NOTE_DL4 196
#define NOTE_DL5 221
#define NOTE_DL6 248
#define NOTE_DL7 278

#define NOTE_DH1 589
#define NOTE_DH2 661
#define NOTE_DH3 700
#define NOTE_DH4 786
#define NOTE_DH5 882
#define NOTE_DH6 990
#define NOTE_DH7 1112
//以上部分是定义是把每个音符和频率值对应起来，其实不用打这么多，但是都打上了，后面可以随意编写D调的各种歌，我这里用NOTE_D+数字表示音符，NOTE_DH+数字表示上面有点的那种音符，NOTE_DL+数字表示下面有点的那种音符。这样后面写起来比较好识别。
#define WHOLE 1
#define HALF 0.5
#define QUARTER 0.25
#define EIGHTH 0.25
#define SIXTEENTH 0.625
//这部分是用英文对应了拍子，这样后面也比较好看
int tune[] = 
{
  NOTE_DH1,NOTE_D6,NOTE_D5,NOTE_D6,NOTE_D0,
  NOTE_DH1,NOTE_D6,NOTE_D5,NOTE_DH1,NOTE_D6,NOTE_D0,NOTE_D6,
  NOTE_D6,NOTE_D6,NOTE_D5,NOTE_D6,NOTE_D0,NOTE_D6,
  NOTE_DH1,NOTE_D6,NOTE_D5,NOTE_DH1,NOTE_D6,NOTE_D0,
  
  NOTE_D1,NOTE_D1,NOTE_D3,
  NOTE_D1,NOTE_D1,NOTE_D3,NOTE_D0,
  NOTE_D6,NOTE_D6,NOTE_D6,NOTE_D5,NOTE_D6,
  NOTE_D5,NOTE_D1,NOTE_D3,NOTE_D0,
  NOTE_DH1,NOTE_D6,NOTE_D6,NOTE_D5,NOTE_D6,
  NOTE_D5,NOTE_D1,NOTE_D2,NOTE_D0,
  NOTE_D7,NOTE_D7,NOTE_D5,NOTE_D3,
  NOTE_D5,
  NOTE_DH1,NOTE_D0,NOTE_D6,NOTE_D6,NOTE_D5,NOTE_D5,NOTE_D6,NOTE_D6,
  NOTE_D0,NOTE_D5,NOTE_D1,NOTE_D3,NOTE_D0,
  NOTE_DH1,NOTE_D0,NOTE_D6,NOTE_D6,NOTE_D5,NOTE_D5,NOTE_D6,NOTE_D6,
  NOTE_D0,NOTE_D5,NOTE_D1,NOTE_D2,NOTE_D0,
  NOTE_D3,NOTE_D3,NOTE_D1,NOTE_DL6,
  NOTE_D1,
  NOTE_D3,NOTE_D5,NOTE_D6,NOTE_D6,
  NOTE_D3,NOTE_D5,NOTE_D6,NOTE_D6,
  NOTE_DH1,NOTE_D0,NOTE_D7,NOTE_D5,
  NOTE_D6,
};//这部分就是整首曲子的音符部分，用了一个序列定义为tune，整数

float duration[]=
{
  1,1,0.5,0.5,1,
  0.5,0.5,0.5,0.5,1,0.5,0.5,
  0.5,1,0.5,1,0.5,0.5,
  0.5,0.5,0.5,0.5,1,1,
  
  1,1,1+1,
  0.5,1,1+0.5,1,
  1,1,0.5,0.5,1,
  0.5,1,1+0.5,1,
  0.5,0.5,0.5,0.5,1+1,
  0.5,1,1+0.5,1,
  1+1,0.5,0.5,1,
  1+1+1+1,
  0.5,0.5,0.5+0.25,0.25,0.5+0.25,0.25,0.5+0.25,0.25,
  0.5,1,0.5,1,1,
  0.5,0.5,0.5+0.25,0.25,0.5+0.25,0.25,0.5+0.25,0.25,
  0.5,1,0.5,1,1,
  1+1,0.5,0.5,1,
  1+1+1+1,
  0.5,1,0.5,1+1,
  0.5,1,0.5,1+1,
  1+1,0.5,0.5,1,
  1+1+1+1
};//这部分是整首曲子的接拍部分，也定义个序列duration，浮点（数组的个数和前面音符的个数是一样的，一一对应么）
int length;//这里定义一个变量，后面用来表示共有多少个音符
int tonePin=8;//蜂鸣器的pin

void setup()
{
  pinMode(tonePin,OUTPUT);//设置蜂鸣器的pin为输出模式
  length = sizeof(tune)/sizeof(tune[0]);//这里用了一个sizeof函数，可以查出tone序列里有多少个音符
}

void loop()
{
  for(int x=0;x<length;x++)//循环音符的次数
  {
	tone(tonePin,tune[x]);//此函数依次播放tune序列里的数组，即每个音符
	delay(400*duration[x]);//每个音符持续的时间，即节拍duration，400是调整时间的越大，曲子速度越慢，越小曲子速度越快，自己掌握吧
	noTone(tonePin);//停止当前音符，进入下一音符
  }
  delay(5000);//等待5秒后，循环重新开始
}


```
