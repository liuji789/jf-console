/**
 * Dazzle数学工具
 * @author qiukq
 * @version 2.0 2012-11-27
 */
Dazzle.util.MathUtils ={
	/**
	 * 精确加法
	 * @scope public
	 * @param nums 加数数组
	 * @param decimalPlace 保留小数位
	 * @param roundType 取整类型
	 * @return 和
	 */
	add:function(nums,decimalPlace,roundType){
		var maxDecimalPlace = this.getMaxDecimalPlace(nums);
		var maxPow = Math.pow(10, maxDecimalPlace);
		var sum = 0;
		for(var i=0; i<nums.length; i++) {
			sum += parseFloat(nums[i]) * maxPow;
		}
		sum = this.getExactNum(sum,maxDecimalPlace,decimalPlace,roundType);
		return sum;
	},
	/**
	 * 精确减法
	 * @scope public
	 * @param nums 减数数组
	 * @param decimalPlace 保留小数位
	 * @param roundType 取整类型
	 * @return 差
	 */
	sub:function(nums,decimalPlace,roundType){
		var maxDecimalPlace = this.getMaxDecimalPlace(nums);
		var maxPow = Math.pow(10, maxDecimalPlace);
		var diff = parseFloat(nums[0]) * maxPow;
		for(var i=1; i<nums.length; i++) {
			diff -= parseFloat(nums[i]) * maxPow;
		}
		diff = this.getExactNum(diff,maxDecimalPlace,decimalPlace,roundType);
		return diff;
	},
	/**
	 * 精确乘法
	 * @scope public
	 * @param nums 乘数数组
	 * @param decimalPlace 保留小数位
	 * @param roundType 取整类型
	 * @return 积
	 */
	mul:function(nums,decimalPlace,roundType){
		var sumDecimalPlace = this.getSumDecimalPlace(nums);
		var sumPow = Math.pow(10, sumDecimalPlace);
		var product = 1;
		for(var i=0; i<nums.length; i++) {
			product *= Number(nums[i].toString().replace(".",""));
		}
		diff = this.getExactNum(product,sumDecimalPlace,decimalPlace,roundType);
		return diff;
	},
	/**
	 * 精确除法
	 * @scope public
	 * @param nums 除数数组
	 * @param decimalPlace 保留小数位
	 * @param roundType 取整类型
	 * @return 商
	 */
	div:function(nums,decimalPlace,roundType){
		var diffDecimalPlace = this.getDiffDecimalPlace(nums);
		var diffPow = Math.pow(10, diffDecimalPlace);
		var busi = Number(nums[0].toString().replace(".",""));
		for(var i=1; i<nums.length; i++) {
			busi /= Number(nums[i].toString().replace(".",""));
		}
		busi = this.getExactNum(busi,diffDecimalPlace,decimalPlace,roundType);
		return busi;
	},
	/**
	 * 精确取整
	 * @scope public
	 * @param num 数
	 * @param decimalPlace 保留小数位
	 * @param roundType 取整类型
	 * @return 数
	 */
	round:function(num,decimalPlace,roundType){
		var numArr = num.toString().split(".");
		if(numArr.length == 2){
			var curDecimalPlace = numArr[1].length;
			var intNum = Number(num.toString().replace(".",""));
			intNum = this.getExactNum(intNum,curDecimalPlace,decimalPlace,roundType);
			return intNum;
		}
		else {
			return num;
		}
	},
	/**
	 * 精确随机
	 * @scope public
	 * @param min 最小值
	 * @param max 最大值
	 * @param step 随机间隔
	 * @param decimalPlace 保留小数位
	 * @param roundType 取整类型
	 * @return 随机数
	 */
	random:function(min,max,step,decimalPlace,roundType){
		var nums = [min,max];
		var maxDecimalPlace = this.getMaxDecimalPlace(nums);
		var maxPow = Math.pow(10, maxDecimalPlace);
		var minNum = parseFloat(min) * maxPow;
		var maxNum = parseFloat(max) * maxPow;
		var randomNum = parseInt(Math.random() * (maxNum - minNum) / step) * step + minNum;
		randomNum = this.getExactNum(randomNum,maxDecimalPlace,decimalPlace,roundType);
		return randomNum;
	},
	/**
	 * 精确幂
	 * @scope public
	 * @param base 底数
	 * @param exponent 指数
	 * @param decimalPlace 保留小数位
	 * @param roundType 取整类型
	 * @return 幂
	 */
	power:function(base,exponent,decimalPlace,roundType){
		if(parseInt(exponent) == exponent){
			if(exponent > 0){
				var product = base;
				for (var i = 1; i < exponent; i++) {
					product = this.mul([product,base],decimalPlace,null);
				}
				return this.getExactNum(product,0,decimalPlace,roundType);
			}
			else if(exponent < 0){
				var product = base;
				for (var i = -1; i > exponent; i--) {
					product = this.mul([product,base],decimalPlace,null);
				}
				return this.div([1,product],decimalPlace,roundType);
			}
			else {
				return 1;
			}
		}
		else {
			return this.getExactNum(Math.pow(base,exponent),0,decimalPlace,roundType);
		}
	},
	/**
	 * 精确开方
	 * @scope public
	 * @param base 底数
	 * @param exponent 指数
	 * @param decimalPlace 保留小数位
	 * @param roundType 取整类型
	 * @return 开方
	 */
	evol:function(base,exponent,decimalPlace,roundType){
		return this.power(base,this.div([1,exponent],decimalPlace,null),decimalPlace,roundType);
	},
	/**
	 * 获取小数位数和
	 * @scope private
	 * @param nums 数组
	 * @return 小数位数和
	 */
	getSumDecimalPlace:function(nums){
		var sumDecimalPlace = 0;
		for(var i=0; i<nums.length; i++) {
			var numArr = nums[i].toString().split(".");
			if(numArr.length == 2){
				sumDecimalPlace += numArr[1].length;
			}
		}
		return sumDecimalPlace;
	},
	/**
	 * 获取小数位数差
	 * @scope private
	 * @param nums 数组
	 * @return 小数位数差
	 */
	getDiffDecimalPlace:function(nums){
		var diffDecimalPlace = 0;
		try {
			diffDecimalPlace = nums[0].toString().split(".")[1].length;
		} catch (e) {
		}
		for(var i=1; i<nums.length; i++) {
			var numArr = nums[i].toString().split(".");
			if(numArr.length == 2){
				diffDecimalPlace -= numArr[1].length;
			}
		}
		return diffDecimalPlace;
	},
	/**
	 * 获取最大小数位
	 * @scope private
	 * @param nums 数组
	 * @return 最大小数位
	 */
	getMaxDecimalPlace:function(nums){
		var maxDecimalPlace = 0;
		for(var i=0; i<nums.length; i++) {
			var numArr = nums[i].toString().split(".");
			if(numArr.length == 2){
				var curDecimalPlace = numArr[1].length;
				if(curDecimalPlace > maxDecimalPlace){
					maxDecimalPlace = curDecimalPlace;
				}
			}
		}
		return maxDecimalPlace;
	},
	/**
	 * 获取精确数
	 * @scope private
	 * @param num 数
	 * @param maxDecimalPlace 最大小数位
	 * @param decimalPlace 保留小数位
	 * @param roundType 取整类型
	 * @return 精确数
	 */
	getExactNum:function(num,maxDecimalPlace,decimalPlace,roundType){
		var divPow = Math.pow(10, maxDecimalPlace - decimalPlace);
		var decimalPow = Math.pow(10, decimalPlace);
		if(roundType != null){
			var roundFn = Dazzle.constant.UtilsEnums["ROUND_TYPE_"+roundType];
			num = Math[roundFn](num / divPow)/decimalPow;
		}
		else {
			num = num / divPow / decimalPow;
		}
		num = num.toFixed(decimalPlace);
		return num;
	}
}