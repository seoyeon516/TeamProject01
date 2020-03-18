package com.tps.mng.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.ActionSupport;
import com.tps.mng.dto.EigyouDto;
import com.tps.mng.dto.GenbaDetailDto;
import com.tps.mng.dto.GenbaDto;
import com.tps.mng.dto.GenbaInfoDto;
import com.tps.mng.dto.TaisyokuUserDetailDto;
import com.tps.mng.dto.UserAllInfoDto;
import com.tps.mng.dto.UserDetailDto;
import com.tps.mng.dto.UserDto;
import com.tps.mng.dto.UserInfoDto;
import com.tps.mng.entity.Eigyou;
import com.tps.mng.entity.Genba;
import com.tps.mng.entity.GenbaHistory;
import com.tps.mng.service.GenbaService;
import com.tps.mng.service.SearchService;
import com.tps.mng.service.UserService;


@ParentPackage("login")
@Results({
	@Result(name = "genbaSearchInit", location = "genbaSearch.jsp"),
	@Result(name = "genbaSearch", type = "json", params = { "root",
			"genbaInfoDtoList" }),
	@Result(name = "genbaSearchSelect", location = "genbaUpdate.jsp"),
	@Result(name = "success", type = "json", params = { "root",
			"genbaTeamSelectById" }),
	@Result(name = "user_Add", type = "redirect", location = "user_AddPage"),
	@Result(name = "user_AddPage", location = "userAdd.jsp"),
	@Result(name = "userDetailListView", location = "userDetailListView.jsp"),
	@Result(name = "userListSearch", location = "userDetailListView.jsp"),
	@Result(name = "goMenu", location = "menu.jsp"),
	@Result(name = "genbaTorokuInit", location = "genbatoroku.jsp"),
	@Result(name = "genbaToroku", location = "genbaSearchInit"),
	@Result(name = "gennbaSyuseiInit", location = "genbasyusei.jsp"),
	@Result(name = "gennbaSyusei", type = "redirect", location = "genbaSearchInit"),
	@Result(name = "userListSelect", location = "eigyouListView.jsp"),
	@Result(name = "userListSelectTaisyoku", location = "taisyokuReg.jsp"),
	@Result(name = "eigyouListView", location = "eigyouListView.jsp"),
	@Result(name = "taisyokuPage", location = "taisyokuReg.jsp"),
	@Result(name = "taisyokuUpdate", location = "taisyokuReg.jsp"),
	@Result(name = "taisyokuList", location = "/taisyokuPage", type = "redirect"),
	@Result(name = "taisyokuUserDesc", type = "json", params = { "root",
			"userAllInfoDto" }),
	@Result(name = "UserModifyInitDone", location = "UserModify.jsp"),
	@Result(name = "UserModifyDone", type = "json", params = { "root",
			"userAllInfoDto" })
})

public class UserAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;

	private Map<String, Object> session;

	@Resource
	private UserService userService;

	@Resource
	private SearchService searchService;

	private List<UserDetailDto> userDetailList;

	private String keyWord;

	private int userStatus;

	private UserDto userDto;

	private List<UserDto> userDtoList;

	private UserDetailDto userDetailDto;

	private List<UserInfoDto> userInfoDtoList;

	private UserInfoDto userInfoDto;

	@Resource
	private GenbaService genbaService;

	private String searchWord;

	private int genbasyainsu;

	private boolean maeReaderHito = false;

	private List<GenbaDto> genbaDtoList;

	private GenbaDto genbaInfo;

	private GenbaDetailDto genbaDetailInfo;

	private UserAllInfoDto userAllInfoDto;

	private List<GenbaInfoDto> genbaInfoDtoList;

	private List<UserDetailDto> selectGenbaTeamListByGenbaId;

	private List<GenbaDetailDto> genbaDetailDtoListByGenbaId;

	private List<GenbaDetailDto> genbaDetailDtoListByUserId;

	private GenbaDetailDto genbaTeamSelectById;

	private Eigyou eigyou;

	private List<EigyouDto> eigyouList;

	private EigyouDto eigyouInfo;

	private Genba genba;

	private GenbaDto genbaDto;

	private List<GenbaDto> genbaList;

	private List<EigyouDto> eigyouDtoList;

	private List<UserDetailDto> userDetailDtoList;

	private int eigyouId;

	private EigyouDto eigyouDto;

	private int userId;

	private int result;

	private int genbaId;

	private TaisyokuUserDetailDto  taisyokuDto;

	private List<GenbaDetailDto> genbaDetailDtoList;

	private GenbaDetailDto genbaDetailDto;

	private GenbaHistory genbaHistory;

	private static final int SESSION_USERSTATUSTAISYOKU = 5;

	private static final int SESSION_GENBAHISTORYRSTATUSTAISYOKU = 0;

	public int userGenbaId;

	public ArrayList<UserDto> genbaDetailList;

	private int userGenbaStatus;

	private int userKeyman;

	@Action(value = "/goMenu")
	public String goMenu() {
		return "goMenu";
	}

	@Action(value = "/user_AddPage")
	public String user_AddPage() {
		return "user_AddPage";
	}

	@Action(value = "/user_Add")
	public String insertUser() {
		userService.insertUser(userDto);
		return "user_Add";
	}

	@Action(value = "/userListSearch")
	public String userListSearch() {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userStatus", userStatus);
		map.put("keyWord", keyWord);

		if(keyWord.equals("")){
			if(userStatus == 0){
				userDetailList = searchService.searchUser();
			}else{
				userDetailList = searchService.selectUserListByCase(userStatus);
			}

		}else if(keyWord.matches("^[ァ-ヶ]*$")){
			userDetailList = searchService.selectUserListByCaseAndKana(map);

		}else if(keyWord.matches("^[ㄱ-ㅎ가-힣]*$")){
			userDetailList = searchService.selectUserListByCaseAndKor(map);
		}
		return "userListSearch";
	}

	@Action(value = "/userDetailListView")
	public String userDetailListView() {
		userDetailList = searchService.searchUser();
		return "userDetailListView";
	}

	@Action("/genbaSearchInit")
	public String genbaSearchInit() {

		genbaInfoDtoList = genbaService.genbaInfoSearchAll();

		return "genbaSearchInit";
	}

	@Action("/genbaSearch")
	public String genbaSearch() {

		genbaInfoDtoList = genbaService.genbaInfoSearch(searchWord);

		return "genbaSearch";
	}

	@Action("/genbaSearchSelect")
	public String genbaSearchSelect() {

		genbaDetailDtoListByGenbaId = genbaService
				.genbaTeamSelectByGenbaId(genbaDetailInfo.getGenbaId());

		for (GenbaDetailDto genbaDetailDto : genbaDetailDtoListByGenbaId) {

			if (genbaDetailDto.getGenbaStatus() == 2) {

				maeReaderHito = true;

			}
		}

		return "genbaSearchSelect";

	}

	@Action("/genbaSelectSearchGamen")
	public String genbaSelectSearchGamen() {

		genbaTeamSelectById = genbaService.genbaTeamSelectById(genbaDetailInfo
				.getUserId());

		userAllInfoDto = userService.selectUser(genbaDetailInfo.getUserId());

		genbaTeamSelectById.setUserKyuuryou(userAllInfoDto.getUserKyuuryou());

		return "success";

	}

	@Action("/gennbaSyuseiInit")
	@SkipValidation
	public String gennbaSyuseiInit() {

		genbaDtoList = genbaService.getGenbaSelect();
		eigyouDtoList = userService.getEigyouSelect();

		return "gennbaSyuseiInit";
	}

	@Action("/genba_TorokuInit")
	@SkipValidation
	public String genbaTorokuInit() {

		eigyouDtoList = userService.getEigyouSelect();

		return "genbaTorokuInit";
	}

	@Action("/genba_Toroku")
	public String genbaToroku() {

		genbaDto.setEigyouId(eigyouDto.getEigyouId());
		genbaService.genbaToroku(genbaDto);

		return "genbaToroku";
	}

	@Action("/gennbaSyusei")
	@SkipValidation
	public String gennbaSyusei() {

		genbaDto.setEigyouId(eigyouDto.getEigyouId());
	    genbaService.genbaUpdate(genbaDto);

	    return "gennbaSyusei";
	}

	@Action(value = "/eigyouListView")
	public String eigyouListView() {
		eigyouDtoList = userService.getEigyouSelect();
		userDetailDtoList = searchService.searchEigyouList();
		return "eigyouListView";
	}

	@Action(value = "/taisyokuPage")
	public String taisyokuPage() {
		eigyouDtoList = userService.getEigyouSelect();
		userDetailDtoList = searchService.searchEigyouList();
		return "taisyokuPage";
	}

	@Action(value = "/userListSelect")
	public String userListSelect() {
		userDetailDtoList = searchService.searchEigyouList(eigyouDto
				.getEigyouId());
		eigyouDtoList = userService.getEigyouSelect();
		return "userListSelect";
	}

	@Action(value = "/userListSelectTaisyoku")
	public String userListSelectTaisyoku() {
		userDetailDtoList = searchService.searchEigyouList(eigyouDto
				.getEigyouId());
		eigyouDtoList = userService.getEigyouSelect();
		return "userListSelectTaisyoku";
	}

	@Action(value = "/taisyokuUpdate")
	public String taisyokuUpdate() {
		userAllInfoDto.setUserId(userAllInfoDto.getUserId());
		userAllInfoDto.setUserGenbaId(userAllInfoDto.getUserGenbaId());

		userDto.setUserStatus(SESSION_USERSTATUSTAISYOKU);
		userService.retireUser(userDto);
		userAllInfoDto.setGenbaHistoryStatus(SESSION_GENBAHISTORYRSTATUSTAISYOKU);
		genbaService.genbaMemberStatusUpdate(userAllInfoDto);

		return "taisyokuUpdate";
	}

	@Action(value = "/taisyokuList")
	public String taisyokuList() {
		userAllInfoDto = userService.selectUser(userId);
		return "taisyokuList";
	}

	@Action(value = "/taisyokuUserDesc")
	@SkipValidation
	public String taisyokuUserDesc() {

		userAllInfoDto = userService.selectUser(userId);
		genbaDetailDto = genbaService.genbaTeamSelectById(userId);
		genbaDto       = genbaService.genbaSelect(genbaDetailDto.getGenbaId());

		userAllInfoDto.setUserGenbaKaisyamei(genbaDto.getGenbaKaisyamei());
		userAllInfoDto.setUserGenbaBasyo(genbaDto.getGenbaBasho());
		userAllInfoDto.setGenbaHyouka(genbaDto.getGenbaHyouka());
		userAllInfoDto.setEigyouGenbaTourokubi(genbaDto.getGenbaTourokubi());
		userAllInfoDto.setUserGenbaId(genbaDto.getGenbaId());
		userAllInfoDto.setUserGenbaNyuujyoubi(genbaDetailDto.getGenbaNyuujyoubi());
		userAllInfoDto.setUserGenbaTaijyoubi(genbaDetailDto.getGenbaTaijyoubi());
		userAllInfoDto.setUserGenbaStatus(genbaDetailDto.getGenbaStatus());
		userAllInfoDto.setUserGenbaHyouka(genbaDetailDto.getGenbaHyouka());

		return "taisyokuUserDesc";
	}

	@Action("/userModifyInit")
	public String UserModifyInit() {

		userAllInfoDto = userService.selectUser(userAllInfoDto.getUserId());

		genbaDetailInfo = genbaService.genbaTeamSelectById(userAllInfoDto
				.getUserId());

		if (userAllInfoDto.getUserStatus() == 2) {

			genbaDetailDtoList = genbaService
					.genbaTeamSelectByGenbaId(genbaDetailInfo.getGenbaId());

		}

		eigyouDtoList = userService.getEigyouSelect();

		return "UserModifyInitDone";
	}

	@Action("/UserModifyDone")
	public String UserModifySubmit() {

		userService.editUser(userAllInfoDto);

		return "UserModifyDone";
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public List<UserDetailDto> getUserDetailList() {
		return userDetailList;
	}

	public void setUserDetailList(List<UserDetailDto> userDetailList) {
		this.userDetailList = userDetailList;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public int getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}

	public UserDto getUserDto() {
		return userDto;
	}

	public void setUserDto(UserDto userDto) {
		this.userDto = userDto;
	}

	public List<UserDto> getUserDtoList() {
		return userDtoList;
	}

	public void setUserDtoList(List<UserDto> userDtoList) {
		this.userDtoList = userDtoList;
	}

	public UserDetailDto getUserDetailDto() {
		return userDetailDto;
	}

	public void setUserDetailDto(UserDetailDto userDetailDto) {
		this.userDetailDto = userDetailDto;
	}

	public List<UserInfoDto> getUserInfoDtoList() {
		return userInfoDtoList;
	}

	public void setUserInfoDtoList(List<UserInfoDto> userInfoDtoList) {
		this.userInfoDtoList = userInfoDtoList;
	}

	public UserInfoDto getUserInfoDto() {
		return userInfoDto;
	}

	public void setUserInfoDto(UserInfoDto userInfoDto) {
		this.userInfoDto = userInfoDto;
	}

	public GenbaService getGenbaService() {
		return genbaService;
	}

	public void setGenbaService(GenbaService genbaService) {
		this.genbaService = genbaService;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public int getGenbasyainsu() {
		return genbasyainsu;
	}

	public void setGenbasyainsu(int genbasyainsu) {
		this.genbasyainsu = genbasyainsu;
	}

	public boolean isMaeReaderHito() {
		return maeReaderHito;
	}

	public void setMaeReaderHito(boolean maeReaderHito) {
		this.maeReaderHito = maeReaderHito;
	}

	public List<GenbaDto> getGenbaDtoList() {
		return genbaDtoList;
	}

	public void setGenbaDtoList(List<GenbaDto> genbaDtoList) {
		this.genbaDtoList = genbaDtoList;
	}

	public GenbaDto getGenbaInfo() {
		return genbaInfo;
	}

	public void setGenbaInfo(GenbaDto genbaInfo) {
		this.genbaInfo = genbaInfo;
	}

	public GenbaDetailDto getGenbaDetailInfo() {
		return genbaDetailInfo;
	}

	public void setGenbaDetailInfo(GenbaDetailDto genbaDetailInfo) {
		this.genbaDetailInfo = genbaDetailInfo;
	}

	public UserAllInfoDto getUserAllInfoDto() {
		return userAllInfoDto;
	}

	public void setUserAllInfoDto(UserAllInfoDto userAllInfoDto) {
		this.userAllInfoDto = userAllInfoDto;
	}

	public List<GenbaInfoDto> getGenbaInfoDtoList() {
		return genbaInfoDtoList;
	}

	public void setGenbaInfoDtoList(List<GenbaInfoDto> genbaInfoDtoList) {
		this.genbaInfoDtoList = genbaInfoDtoList;
	}

	public List<UserDetailDto> getSelectGenbaTeamListByGenbaId() {
		return selectGenbaTeamListByGenbaId;
	}

	public void setSelectGenbaTeamListByGenbaId(
			List<UserDetailDto> selectGenbaTeamListByGenbaId) {
		this.selectGenbaTeamListByGenbaId = selectGenbaTeamListByGenbaId;
	}

	public List<GenbaDetailDto> getGenbaDetailDtoListByGenbaId() {
		return genbaDetailDtoListByGenbaId;
	}

	public void setGenbaDetailDtoListByGenbaId(
			List<GenbaDetailDto> genbaDetailDtoListByGenbaId) {
		this.genbaDetailDtoListByGenbaId = genbaDetailDtoListByGenbaId;
	}

	public List<GenbaDetailDto> getGenbaDetailDtoListByUserId() {
		return genbaDetailDtoListByUserId;
	}

	public void setGenbaDetailDtoListByUserId(
			List<GenbaDetailDto> genbaDetailDtoListByUserId) {
		this.genbaDetailDtoListByUserId = genbaDetailDtoListByUserId;
	}

	public GenbaDetailDto getGenbaTeamSelectById() {
		return genbaTeamSelectById;
	}

	public void setGenbaTeamSelectById(GenbaDetailDto genbaTeamSelectById) {
		this.genbaTeamSelectById = genbaTeamSelectById;
	}

	public Eigyou getEigyou() {
		return eigyou;
	}

	public void setEigyou(Eigyou eigyou) {
		this.eigyou = eigyou;
	}

	public List<EigyouDto> getEigyouList() {
		return eigyouList;
	}

	public void setEigyouList(List<EigyouDto> eigyouList) {
		this.eigyouList = eigyouList;
	}

	public EigyouDto getEigyouInfo() {
		return eigyouInfo;
	}

	public void setEigyouInfo(EigyouDto eigyouInfo) {
		this.eigyouInfo = eigyouInfo;
	}

	public Genba getGenba() {
		return genba;
	}

	public void setGenba(Genba genba) {
		this.genba = genba;
	}

	public GenbaDto getGenbaDto() {
		return genbaDto;
	}

	public void setGenbaDto(GenbaDto genbaDto) {
		this.genbaDto = genbaDto;
	}

	public List<GenbaDto> getGenbaList() {
		return genbaList;
	}

	public void setGenbaList(List<GenbaDto> genbaList) {
		this.genbaList = genbaList;
	}

	public List<EigyouDto> getEigyouDtoList() {
		return eigyouDtoList;
	}

	public void setEigyouDtoList(List<EigyouDto> eigyouDtoList) {
		this.eigyouDtoList = eigyouDtoList;
	}

	public List<UserDetailDto> getUserDetailDtoList() {
		return userDetailDtoList;
	}

	public void setUserDetailDtoList(List<UserDetailDto> userDetailDtoList) {
		this.userDetailDtoList = userDetailDtoList;
	}

	public int getEigyouId() {
		return eigyouId;
	}

	public void setEigyouId(int eigyouId) {
		this.eigyouId = eigyouId;
	}

	public EigyouDto getEigyouDto() {
		return eigyouDto;
	}

	public void setEigyouDto(EigyouDto eigyouDto) {
		this.eigyouDto = eigyouDto;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public int getGenbaId() {
		return genbaId;
	}

	public void setGenbaId(int genbaId) {
		this.genbaId = genbaId;
	}

	public TaisyokuUserDetailDto getTaisyokuDto() {
		return taisyokuDto;
	}

	public void setTaisyokuDto(TaisyokuUserDetailDto taisyokuDto) {
		this.taisyokuDto = taisyokuDto;
	}

	public List<GenbaDetailDto> getGenbaDetailDtoList() {
		return genbaDetailDtoList;
	}

	public void setGenbaDetailDtoList(List<GenbaDetailDto> genbaDetailDtoList) {
		this.genbaDetailDtoList = genbaDetailDtoList;
	}

	public GenbaDetailDto getGenbaDetailDto() {
		return genbaDetailDto;
	}

	public void setGenbaDetailDto(GenbaDetailDto genbaDetailDto) {
		this.genbaDetailDto = genbaDetailDto;
	}

	public GenbaHistory getGenbaHistory() {
		return genbaHistory;
	}

	public void setGenbaHistory(GenbaHistory genbaHistory) {
		this.genbaHistory = genbaHistory;
	}

	public static int getSessionUserstatustaisyoku() {
		return SESSION_USERSTATUSTAISYOKU;
	}

	public static int getSessionGenbahistoryrstatustaisyoku() {
		return SESSION_GENBAHISTORYRSTATUSTAISYOKU;
	}

	public int getUserGenbaId() {
		return userGenbaId;
	}

	public void setUserGenbaId(int userGenbaId) {
		this.userGenbaId = userGenbaId;
	}

	public int getUserGenbaStatus() {
		return userGenbaStatus;
	}

	public void setUserGenbaStatus(int userGenbaStatus) {
		this.userGenbaStatus = userGenbaStatus;
	}

	public int getUserKeyman() {
		return userKeyman;
	}

	public void setUserKeyman(int userKeyman) {
		this.userKeyman = userKeyman;
	}
}
