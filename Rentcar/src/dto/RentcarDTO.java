package dto;

import java.sql.Date;

public class RentcarDTO {
	
	private String locations;
	private Date starts;
	private String starttime;
	private Date ends;
	private String endtime;
	private String variety;
	private String reid;
	private String insurance;
	private int renum;
	
	/**
	 * @return the locations
	 */
	public String getLocations() {
		return locations;
	}
	/**
	 * @param locations the locations to set
	 */
	public void setLocations(String locations) {
		this.locations = locations;
	}
	/**
	 * @return the starts
	 */
	public Date getStarts() {
		return starts;
	}
	/**
	 * @param starts the starts to set
	 */
	public void setStarts(Date starts) {
		this.starts = starts;
	}
	/**
	 * @return the starttime
	 */
	public String getStarttime() {
		return starttime;
	}
	/**
	 * @param starttime the starttime to set
	 */
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	/**
	 * @return the ends
	 */
	public Date getEnds() {
		return ends;
	}
	/**
	 * @param ends the ends to set
	 */
	public void setEnds(Date ends) {
		this.ends = ends;
	}
	/**
	 * @return the endtime
	 */
	public String getEndtime() {
		return endtime;
	}
	/**
	 * @param endtime the endtime to set
	 */
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	/**
	 * @return the variety
	 */
	public String getVariety() {
		return variety;
	}
	/**
	 * @param variety the variety to set
	 */
	public void setVariety(String variety) {
		this.variety = variety;
	}
	/**
	 * @return the reid
	 */
	public String getReid() {
		return reid;
	}
	/**
	 * @param reid the reid to set
	 */
	public void setReid(String reid) {
		this.reid = reid;
	}
	/**
	 * @return the insurance
	 */
	public String getInsurance() {
		return insurance;
	}
	/**
	 * @param insurance the insurance to set
	 */
	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}
	/**
	 * @return the renum
	 */
	public int getRenum() {
		return renum;
	}
	/**
	 * @param renum the renum to set
	 */
	public void setRenum(int renum) {
		this.renum = renum;
	}
	
	@Override
	public String toString() {
		return "RentcarDTO [locations=" + locations + ", starts=" + starts + ", starttime=" + starttime + ", ends="
				+ ends + ", endtime=" + endtime + ", variety=" + variety + ", reid=" + reid + ", insurance=" + insurance
				+ ", renum=" + renum + "]";
	}
	
	

}
