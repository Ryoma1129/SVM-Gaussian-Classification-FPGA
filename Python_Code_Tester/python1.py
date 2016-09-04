#	The program computes 629 Ai's by multiplication of 900 exp(-mod(x_j-z_ij)/(2sigma^2))
#	Here the z_ij is the (629 SVMs: Zi * 30x30 pixel set: Zij) and x_j (30x30 image vector: X)
#	sigma assumed to be 625
#	The weights are ai
#	and then add those Ai's to compute the final result i.e. classification of X
#	i[0,629]
#	j[0,899]
#
#
#	The following data are intialized in a file
#		ai -- 629 Values stored in Logarithmic Number System (LNS)
#			  weighted according to the 'weight' value specified ranging
#			  from 0 to 30
#		zi -- 629 SVMs each 900 pixel (8bit)
#		xi -- Input image 900 pixel (8bit)
#	The same data is used by the Hardware Design Testbench (Verilog) to initilize 
#	 	ai and zi; and
#		periodic entering of image X into the design
#
#
#
#	To initialize the data run the 'initialize_data()' function with file names and
#	weights of ai specified
#
#	Compute the results through 'compute_results()' function
#
#
import random
import math

def byte_write(fo):
    for k in range(0, 8):
        j = random.randint(0, 1)
        fo.write(str(j))
    fo.write('\n')
def byte_write1(fo):
    for k in range(0, 8):
        j = random.randint(0, 1)
        fo.write(str(j))

def add(x, y):
    maxlen = max(len(x), len(y))

    # Normalize lengths
    x = x.zfill(maxlen)
    y = y.zfill(maxlen)

    result = ''
    carry = 0

    for i in range(maxlen - 1, -1, -1):
        r = carry
        r += 1 if x[i] == '1' else 0
        r += 1 if y[i] == '1' else 0

        # r can be 0,1,2,3 (carry + x[i] + y[i])
        # and among these, for r==1 and r==3 you will have result bit = 1
        # for r==2 and r==3 you will have carry = 1

        result = ('1' if r % 2 == 1 else '0') + result
        carry = 0 if r < 2 else 1

    if carry != 0: result = '1' + result

    return result[1:]

def int2bin(z):
    i = int(z)
    if i == 0: return "00000000"
    si = ''
    j = 1
    while (i > 0 or j < 9):
        if i & 1 == 1:
            si = "1" + si
        else:
            si = "0" + si
        i /= 2
        j += 1

    return si
def frac2bin(z):
    flr = int(z)
    i = z - flr
    s = ''
    # isq=float(i*i);base=float(2*512*512)
    # num=isq/base;l=2;
    num = i
    for j in range(0, 22):
        k = int(num * 2)

        if (num * 2 >= 1):
            num = num * 2
            num = num - 1
        else:
            num = num * 2
        s = s + `k`
    return s
def unsign2bin(i):
    
    return int2bin(i) + frac2bin(i)
def sign2bin30(i):
    if i>0 :
        return unsign2bin(i)
    else:
        return unsign2bin(-1*i)
def num2lnsbin32(i):
    if (i!=0):
        k=math.log(abs(i))/math.log(2)
    if i>0:
        if k>=0:
            return "00"+sign2bin30(k)
        elif k<0:
            return "00"+toTwosComplement(sign2bin30(k))
    elif i<0:
        if k>=0:
            return "01"+sign2bin30(k)
        elif k<0:
            return "01"+toTwosComplement(sign2bin30(k))
    elif i==0:
        return "10000000000000000000000000000000"
def exp2lns(z):

    s="00"
    z1=-1*z
    s=s+toTwosComplement(unsign2bin(z1))
    return s
def mod2lns(i):
    num1 = float(i*i)
    num2 = float(2*625*625)
    num  = -1*(num1/(num2*math.log(2)))
    return exp2lns(num)

def num2logadd(i):
    k=float(-1*i)
    l=math.log(1+float(2**k))
    j= l/(math.log(2))
    return j7
def num2logsub(i):
    k=float(-1*i)
    l=math.log(1-float(2**k))
    j= l/(math.log(2))
    return j
def negin2comp(s):
    s1=''
    for i in range(0,30):
        if (s[i]=="0"):
            s1[i]=s1+"1"
        else:
            s1[i]=s1+"0"
    print s1
def toTwosComplement(binarySequence):
    convertedSequence = [0] * len(binarySequence)
    carryBit = 1
    # INVERT THE BITS
    for i in range(0, len(binarySequence)):
        if binarySequence[i] == '0':
            convertedSequence[i] = 1
        else:
            convertedSequence[i] = 0

    # ADD BINARY DIGIT 1

    if convertedSequence[-1] == 0: #if last digit is 0, just add the 1 then there's no carry bit so return
            convertedSequence[-1] = 1
            return ''.join(str(x) for x in convertedSequence)

    for bit in range(0, len(binarySequence)):
        if carryBit == 0:
            break
        index = len(binarySequence) - bit - 1
        if convertedSequence[index] == 1:
            convertedSequence[index] = 0
            carryBit = 1
        else:
            convertedSequence[index] = 1
            carryBit = 0

    return ''.join(str(x) for x in convertedSequence)
def lookup_table():
    for i in range (0,256):
        print "8'b" + int2bin(i) +": lut_out = 32'b"+ mod2lns(i)+"; //" +`i`

def store_a(sa):
    f=open(sa)
    data_array=f.readlines();
    f.close()
    data_a=[]
    for line in data_array:
        data_a.append(line[:-1])
    return data_a
def store_x(sx):
    f=open(sx)
    data_array = f.readlines();
    f.close()
    data_a = []
    for line in data_array:
        data_a.append(line[1:-1])
    data_b = []
    i=0
    for i in range(0,len(data_a)):
        if (len(data_a[i])>1):
            data_b.append(data_a[i])
            i=i+1
    data_c = []
    for i in range(0,225):
        data_c.append(data_b[i][24:32])
        data_c.append(data_b[i][16:24])
        data_c.append(data_b[i][8:16])
        data_c.append(data_b[i][0:8])
    return data_c
def store_z(sz):
    f=open(sz)
    data_array = f.readlines();
    f.close()
    data_b = []
    for line in data_array:
        data_b.append(line[:-1])

    data_c = []
    for i in range(0,len(data_b)):
        data_c.append(data_b[i][24:32])
        data_c.append(data_b[i][16:24])
        data_c.append(data_b[i][8:16])
        data_c.append(data_b[i][0:8])
    return data_c

def bin2dec8(s):
    n=0;l=1;
    for i in range(0,8):
        k=7-i
        n=n+int(s[k])*l
        l=l*2
    return n
def bin2dec7(s):
    n=0;l=1;
    for i in range(0,7):
        k=6-i
        n=n+int(s[k])*l
        l=l*2
    return n
def bin2dec30(s):
    n = float(0)
    l = float(1)
    for i in range(0, 8):
        k = 7 - i
        n = n + int(s[k]) * l
        l = l * 2
    l=float(.5)
    for i in range(0, 22):
        k = 8 + i
        n = n + int(s[k]) * l
        l = l / 2
    return n
def binlnsexp2dec30(s):
    if s[2]=="0":
        a0=bin2dec30(s[2:32])
    else:
        a0=-1*bin2dec30(toTwosComplement(s[2:32]))
    return a0
def lns2dec(s):
    if (s[0:2]=="00"):
        return math.exp(binlnsexp2dec30(s)*math.log(2))
    elif (s[0:2]=="01"):
        return -1*math.exp(binlnsexp2dec30(s)*math.log(2))
    elif (s[0:2]=="10"):
        return 0

def a_init(s,weight):
    f=open(s,"w")
    if (weight>30):
    	weight = 30
    elif (weight<0):
    	weight = 0
    weight_c=30-weight
    for i in range(0,629):
        s=''
        j=random.randint(0,100)
        if (j==1):
            s="10000000000000000000000000000000" #ai=0
        else:
            l1=random.randint(0,1)
            s=s+"0"+`l1` #positive or negative ai
            l=random.randint(0,1)     #exponential value positive or negative
            if(l==0):
                for wei in range(0,weight_c):
                	s=s+"0"
            else:
                for wei in range(0,weight_c):
                	s=s+"1"
            for k in range(0, weight):
                l = random.randint(0, 1)
                s = s + `l`
        f.write(s)
        f.write('\n')
    f.close()
def x_init(s):
    f = open(s, "w")
    for i in range(0,20):
        f.write("d");f.write('\n')
    f.write("s")
    byte_write1(f);byte_write1(f);byte_write1(f);byte_write(f);
    for i in range(0, 223):
        f.write("v")
        byte_write1(f);byte_write1(f);byte_write1(f);byte_write(f);
    f.write("e")
    byte_write1(f);byte_write1(f);byte_write1(f);byte_write(f);
    for i in range(0,20):
        f.write("d");f.write('\n')
    f.close()
def z_init(s):
    f=open(s,"w")
    for i in range(0,141525):
        byte_write1(f);byte_write1(f);byte_write1(f);byte_write(f);
    f.close()


def initialize_data(sx,sz,sa,weight_a):
    x_init(sx)
    z_init(sz)
    a_init(sa,weight_a)
def compute_result(sx,sz,sa,sai):
    arr_a=store_a(sa);arr_x=store_x(sx);arr_z=store_z(sz);
    exp=[];ai=[];Di=[]
  
    for i in range(0,629):#The loop for each SVM computer Ai;
        sum1=0;sum2=0
        for j in range(0,900):#The loop for each x_j,z_ij
            k=float(abs(bin2dec8(arr_x[j])- bin2dec8(arr_z[j+900*i])))
            k=k*k
            n1=float(2*625*625*math.log(2))
            n2=(-1*k)/n1
            sum1=n2+sum1
        ai.append(binlnsexp2dec30(arr_a[i])) #stores ai in array_ai in power of 2
        Di.append(sum1)
        sum2 = Di[i] + ai[i]    #sums Di and ai (both in powers of 2) to get the product in power of 2
        exp.append(sum2)        #the Ai in power of 2 stored in array_exp
    sum_a=0
    m=0
    for i in range(0,629):
        if(arr_a[i][0:2]=="00"):
            m=m+pow(2,exp[i])
        elif(arr_a[i][0:2]=="01"):
            m=m-pow(2,exp[i])
        elif(arr_a[i][0:2]=="10"):
            m=m
    #Stores the value of each Ai
    Ai=[]
    for i in range(0,629):
        if(arr_a[i][0:2]=="00"):
            Ai.append(pow(2,exp[i]))
        elif(arr_a[i][0:2]=="01"):
            Ai.append(-1*pow(2,exp[i]))
        elif(arr_a[i][0:2]=="10"):
            Ai.append(0)
    f1=open(sai,"w")
    for i2 in range(0,629):
        f1.write(num2lnsbin32(Ai[i2]))
        f1.write("\n")
    f1.close()


    # print "maxDi   " +`max(Di)`
    # print  num2lnsbin32(pow(2, max(Di)))
    # print "maxAi   " +`max(Ai)` #Ai=pow(2,Di)
    # print "minDi   " +`min(Di)`
    # print "minAi   " +`min(Ai)`
    print "compute " + `m`
    print num2lnsbin32(m)

sa="init_a.dat";sx="init_x.dat";sz="init_z.dat";sai="Ai_python.dat"
weight_a=25

initialize_data(sx,sz,sa,weight_a)
compute_result(sx,sz,sa,sai)


