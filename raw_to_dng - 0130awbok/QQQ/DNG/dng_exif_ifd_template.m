function ifd = dng_exif_ifd_template(M)

% function ifd = dng_exif_ifd_template(M)
%
% M.x:
% exposure_time
% iso_speed
% date_time
% aperture
% flash

ifd = {...
  struct('tag',33434,'description','ExposureTime','type',5,'count',1,'values',M.exposure_time),...
  struct('tag',33437,'description','FNumber','type',5,'count',1,'values',M.aperture),...
  struct('tag',34850,'description','ExposureProgram','type',3,'count',1,'values',[0]),...
  struct('tag',34855,'description','ISOSpeedRatings','type',3,'count',1,'values',M.iso_speed),...
  struct('tag',36867,'description','DateTimeOriginal','type',2,'count',length(M.date_time)+1,'values',[M.date_time 0]),...
  struct('tag',37377,'description','ShutterSpeedValue','type',10,'count',1,'values',-log2(M.exposure_time)),...
  struct('tag',37378,'description','ApertureValue','type',5,'count',1,'values',2*log2(2.8)),...
  struct('tag',37380,'description','ExposureBiasValue','type',10,'count',1,'values',[0]),...
  struct('tag',37381,'description','MaxApertureValue','type',5,'count',1,'values',2*log2(M.aperture)),...
  struct('tag',37383,'description','MeteringMode','type',3,'count',1,'values',[2]),...
  struct('tag',37385,'description','Flash','type',3,'count',1,'values',M.flash),...
  struct('tag',37386,'description','FocalLength','type',5,'count',1,'values',[M.focal_length])};
