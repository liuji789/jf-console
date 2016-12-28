package com.atguigu.jf.console.item.bean.bo;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import org.springframework.format.annotation.DateTimeFormat;

import com.atguigu.jf.console.item.bean.pojo.ScShop;

@SuppressWarnings("unused")
public class IcItemBean {
	private Long itemId;// 商品单元ID

	private Long mallCatId;// 商城类目ID

	private Long itemCode;// 商品单元编码：新创建商品编码与商品单元ID相同，非新创建商品（由某个已上架商品修改）编码使用其来源商品的编码

	private Long mchtId;// 商家ID

	private String mchtName;// 商家名称

	private Integer itemType;// 商品单元

	private String itemMchtNo;// 商品单元货码

	private String itemName;// 商品单元名称

	private String itemShortName;// 商品单元简称

	private String itemDesc;// 商品单元描述

	private String itemDesc1;// 商品单元描述1（购买须知）

	private String itemDesc2;// 商品单元描述2（使用流程）

	private String itemDesc3;// 商品单元描述3（预留）

	private String itemDesc4;// 商品单元描述4（预留）

	private BigDecimal itemCostPrice;// 商品单元成本价格

	private BigDecimal itemMarketPrice;// 商品单元市场价格

	private BigDecimal itemSalePrice;// 商品单元销售价格

	private Long itemSaleNum;// 商品单元已售数量

	private Long itemNum;// 商品单元库存数量

	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date itemValidStart;// 商品单元有效期起
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date itemValidEnd;// 商品单元有效期止

	private String itemSaleAttr;// 商品单元销售属性:第一位为免预约标识，1表示免预约，0表示不免预约;第二位表示随时退，1表示随时退，0表示不随时退

	private Integer itemApprState;// 商品单元审批状态:0-未提交 1-待审批（审批中） 2-审批通过 3-审批未通过

	private Integer itemUdState;// 商品单元上下架状态:1-已上架(生效) 2-已下架 3-已强制下架 4-已替换下架

	private Date itemStateTime;// 商品单元状态时间

	private Short itemSchdlonState;// 商品单元定时上架状态：0-非定时上架 1-定时上架

	private Date itemSchdlonTime;// 商品单元定时上架时间

	private Date itemSchdldownTime;// 商品单元定时下架时间

	private Short itemForceoffState;// 商品单元强制下架状态（管理员对商品进行强制下架）：0-非强制下架 1-强制下架

	private Date itemForceoffTime;// 商品单元强制下架时间（过一定时间后才允许商家修改，目前未不允许再上架，设置时间为2099-12-31）

	private String itemForceoffReason;// 商品单元强制下架原因

	private String itemSeoKeyword;// 商品单元SEO关键词：（预留）

	private String itemSeoDesc;// 商品单元SEO描述：（预留）

	private Integer itemMaxBuyNums;// 商品单元最大购买数量

	private Short itemSaleFlag;// 商品单元可售标志：（预留）0-不可售 1-可售

	private String optlPayTypeStr;// 可选支付方式：（预留）目前只有积分支付）

	private Integer dataVersion;// 数据版本号：新建时取值1，审批通过后，每发生一次商品修改时产生新产品，该产品与旧产品商品单元编码相同，但版本号加1

	private Short dataState;// 数据状态：1-正常 0-删除

	private Long creator;// 创建人ID

	private Date createTime;// 创建时间

	private Long modifyer;// 修改人ID

	private Date modifyTime;// 修改时间
	
	private String itemTypeName;
	
	private String itemPicUrl;// 商品图片URL（图片文件的路径文件名）

	private String mallCatName;// 商城类目名称(如美食)

	// 新增自定义属性：销售状态

	private String itemState;

	// 分店 在添加或者修改页面上需要 sc_shop中
	private Set<ScShop> scShopSet;

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public Long getMallCatId() {
		return mallCatId;
	}

	public void setMallCatId(Long mallCatId) {
		this.mallCatId = mallCatId;
	}

	public Long getItemCode() {
		return itemCode;
	}

	public void setItemCode(Long itemCode) {
		this.itemCode = itemCode;
	}

	public Long getMchtId() {
		return mchtId;
	}

	public void setMchtId(Long mchtId) {
		this.mchtId = mchtId;
	}

	public String getMchtName() {
		return mchtName;
	}

	public void setMchtName(String mchtName) {
		this.mchtName = mchtName;
	}

	public Integer getItemType() {
		return itemType;
	}

	public void setItemType(Integer itemType) {
		this.itemType = itemType;
	}

	public String getItemMchtNo() {
		return itemMchtNo;
	}

	public void setItemMchtNo(String itemMchtNo) {
		this.itemMchtNo = itemMchtNo;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemShortName() {
		return itemShortName;
	}

	public void setItemShortName(String itemShortName) {
		this.itemShortName = itemShortName;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public String getItemDesc1() {
		return itemDesc1;
	}

	public void setItemDesc1(String itemDesc1) {
		this.itemDesc1 = itemDesc1;
	}

	public String getItemDesc2() {
		return itemDesc2;
	}

	public void setItemDesc2(String itemDesc2) {
		this.itemDesc2 = itemDesc2;
	}

	public String getItemDesc3() {
		return itemDesc3;
	}

	public void setItemDesc3(String itemDesc3) {
		this.itemDesc3 = itemDesc3;
	}

	public String getItemDesc4() {
		return itemDesc4;
	}

	public void setItemDesc4(String itemDesc4) {
		this.itemDesc4 = itemDesc4;
	}

	public BigDecimal getItemCostPrice() {
		return itemCostPrice;
	}

	public void setItemCostPrice(BigDecimal itemCostPrice) {
		this.itemCostPrice = itemCostPrice;
	}

	public BigDecimal getItemMarketPrice() {
		return itemMarketPrice;
	}

	public void setItemMarketPrice(BigDecimal itemMarketPrice) {
		this.itemMarketPrice = itemMarketPrice;
	}

	public BigDecimal getItemSalePrice() {
		return itemSalePrice;
	}

	public void setItemSalePrice(BigDecimal itemSalePrice) {
		this.itemSalePrice = itemSalePrice;
	}

	public Long getItemSaleNum() {
		return itemSaleNum;
	}

	public void setItemSaleNum(Long itemSaleNum) {
		this.itemSaleNum = itemSaleNum;
	}

	public Long getItemNum() {
		return itemNum;
	}

	public void setItemNum(Long itemNum) {
		this.itemNum = itemNum;
	}

	public Date getItemValidStart() {
		return itemValidStart;
	}
	
	public String getItemValidStartFormat(){
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String string = format.format(itemValidStart);
    	return string;
	}

	public void setItemValidStart(Date itemValidStart) {
		this.itemValidStart = itemValidStart;
	}

	public Date getItemValidEnd() {
		return itemValidEnd;
	}
	
	public String getItemValidEndFormat() {
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String string = format.format(itemValidEnd);
    	return string;
	}
	
	public void setItemValidEnd(Date itemValidEnd) {
		this.itemValidEnd = itemValidEnd;
	}

	public String getItemSaleAttr() {
		return itemSaleAttr;
	}

	public void setItemSaleAttr(String itemSaleAttr) {
		this.itemSaleAttr = itemSaleAttr;
	}

	public Integer getItemApprState() {
		return itemApprState;
	}

	public void setItemApprState(Integer itemApprState) {
		this.itemApprState = itemApprState;
	}

	public Integer getItemUdState() {
		return itemUdState;
	}

	public void setItemUdState(Integer itemUdState) {
		this.itemUdState = itemUdState;
	}

	public Date getItemStateTime() {
		return itemStateTime;
	}

	public void setItemStateTime(Date itemStateTime) {
		this.itemStateTime = itemStateTime;
	}

	public Short getItemSchdlonState() {
		return itemSchdlonState;
	}

	public void setItemSchdlonState(Short itemSchdlonState) {
		this.itemSchdlonState = itemSchdlonState;
	}

	public Date getItemSchdlonTime() {
		return itemSchdlonTime;
	}

	public void setItemSchdlonTime(Date itemSchdlonTime) {
		this.itemSchdlonTime = itemSchdlonTime;
	}

	public Date getItemSchdldownTime() {
		return itemSchdldownTime;
	}

	public void setItemSchdldownTime(Date itemSchdldownTime) {
		this.itemSchdldownTime = itemSchdldownTime;
	}

	public Short getItemForceoffState() {
		return itemForceoffState;
	}

	public void setItemForceoffState(Short itemForceoffState) {
		this.itemForceoffState = itemForceoffState;
	}

	public Date getItemForceoffTime() {
		return itemForceoffTime;
	}

	public void setItemForceoffTime(Date itemForceoffTime) {
		this.itemForceoffTime = itemForceoffTime;
	}

	public String getItemForceoffReason() {
		return itemForceoffReason;
	}

	public void setItemForceoffReason(String itemForceoffReason) {
		this.itemForceoffReason = itemForceoffReason;
	}

	public String getItemSeoKeyword() {
		return itemSeoKeyword;
	}

	public void setItemSeoKeyword(String itemSeoKeyword) {
		this.itemSeoKeyword = itemSeoKeyword;
	}

	public String getItemSeoDesc() {
		return itemSeoDesc;
	}

	public void setItemSeoDesc(String itemSeoDesc) {
		this.itemSeoDesc = itemSeoDesc;
	}

	public Integer getItemMaxBuyNums() {
		return itemMaxBuyNums;
	}

	public void setItemMaxBuyNums(Integer itemMaxBuyNums) {
		this.itemMaxBuyNums = itemMaxBuyNums;
	}

	public Short getItemSaleFlag() {
		return itemSaleFlag;
	}

	public void setItemSaleFlag(Short itemSaleFlag) {
		this.itemSaleFlag = itemSaleFlag;
	}

	public String getOptlPayTypeStr() {
		return optlPayTypeStr;
	}

	public void setOptlPayTypeStr(String optlPayTypeStr) {
		this.optlPayTypeStr = optlPayTypeStr;
	}

	public Integer getDataVersion() {
		return dataVersion;
	}

	public void setDataVersion(Integer dataVersion) {
		this.dataVersion = dataVersion;
	}

	public Short getDataState() {
		return dataState;
	}

	public void setDataState(Short dataState) {
		this.dataState = dataState;
	}

	public Long getCreator() {
		return creator;
	}

	public void setCreator(Long creator) {
		this.creator = creator;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Long getModifyer() {
		return modifyer;
	}

	public void setModifyer(Long modifyer) {
		this.modifyer = modifyer;
	}

	public Date getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getItemTypeName() {
		return itemTypeName;
	}

	public void setItemTypeName(String itemTypeName) {
		this.itemTypeName = itemTypeName;
	}

	public String getItemPicUrl() {
		return itemPicUrl;
	}

	public void setItemPicUrl(String itemPicUrl) {
		this.itemPicUrl = itemPicUrl;
	}

	public String getMallCatName() {
		return mallCatName;
	}

	public void setMallCatName(String mallCatName) {
		this.mallCatName = mallCatName;
	}

	public String getItemState() {
		return itemApprState+""+itemUdState;
	}

	public void setItemState(String itemState) {
		this.itemState = itemState;
	}

	public Set<ScShop> getScShopSet() {
		return scShopSet;
	}

	public void setScShopSet(Set<ScShop> scShopSet) {
		this.scShopSet = scShopSet;
	}

	// 审批记录
//	 private Set<ApproveDef> approveDefSet;

	
	

}