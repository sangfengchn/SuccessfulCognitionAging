function sfSegment(t1w, SPMPATH)
addpath(SPMPATH);

st.vol = spm_vol(t1w);
vs = st.vol.mat\eye(4);
vs(1:3,4) = (st.vol.dim+1)/2;
spm_get_space(st.vol.fname,inv(vs));

data = strcat(t1w, ',1');
spm_jobman('initcfg');

%% Segment by cat12
%-----------------------------------------------------------------------
% Job saved on 06-Oct-2022 10:18:01 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.tools.cat.estwrite.data = {data};
matlabbatch{1}.spm.tools.cat.estwrite.data_wmh = {''};
matlabbatch{1}.spm.tools.cat.estwrite.nproc = 8;
matlabbatch{1}.spm.tools.cat.estwrite.useprior = '';
matlabbatch{1}.spm.tools.cat.estwrite.opts.tpm = {fullfile(SPMPATH, 'tpm', 'TPM.nii')};
matlabbatch{1}.spm.tools.cat.estwrite.opts.affreg = 'mni';
matlabbatch{1}.spm.tools.cat.estwrite.opts.biasacc = 0.5;
matlabbatch{1}.spm.tools.cat.estwrite.extopts.APP = 1070;
matlabbatch{1}.spm.tools.cat.estwrite.extopts.spm_kamap = 0;
matlabbatch{1}.spm.tools.cat.estwrite.extopts.LASstr = 0.5;
matlabbatch{1}.spm.tools.cat.estwrite.extopts.gcutstr = 2;
matlabbatch{1}.spm.tools.cat.estwrite.extopts.WMHC = 1;
matlabbatch{1}.spm.tools.cat.estwrite.extopts.registration.shooting.shootingtpm = {fullfile(SPMPATH, 'toolbox', 'cat12', 'templates_volumes', 'Template_0_IXI555_MNI152_GS.nii')};
matlabbatch{1}.spm.tools.cat.estwrite.extopts.registration.shooting.regstr = 0.5;
matlabbatch{1}.spm.tools.cat.estwrite.extopts.vox = 1.5;
matlabbatch{1}.spm.tools.cat.estwrite.extopts.restypes.optimal = [1 0.1];
matlabbatch{1}.spm.tools.cat.estwrite.extopts.ignoreErrors = 1;
matlabbatch{1}.spm.tools.cat.estwrite.output.surface = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.surf_measures = 1;
matlabbatch{1}.spm.tools.cat.estwrite.output.ROImenu.noROI = struct([]);
matlabbatch{1}.spm.tools.cat.estwrite.output.GM.native = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.GM.mod = 1;
matlabbatch{1}.spm.tools.cat.estwrite.output.GM.dartel = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.WM.native = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.WM.mod = 1;
matlabbatch{1}.spm.tools.cat.estwrite.output.WM.dartel = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.CSF.native = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.CSF.warped = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.CSF.mod = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.CSF.dartel = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.ct.native = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.ct.warped = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.ct.dartel = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.pp.native = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.pp.warped = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.pp.dartel = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.WMH.native = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.WMH.warped = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.WMH.mod = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.WMH.dartel = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.SL.native = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.SL.warped = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.SL.mod = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.SL.dartel = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.TPMC.native = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.TPMC.warped = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.TPMC.mod = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.TPMC.dartel = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.atlas.native = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.atlas.warped = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.atlas.dartel = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.label.native = 1;
matlabbatch{1}.spm.tools.cat.estwrite.output.label.warped = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.label.dartel = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.labelnative = 1;
matlabbatch{1}.spm.tools.cat.estwrite.output.bias.warped = 1;
matlabbatch{1}.spm.tools.cat.estwrite.output.las.native = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.las.warped = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.las.dartel = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.jacobianwarped = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.warps = [0 0];
matlabbatch{1}.spm.tools.cat.estwrite.output.rmat = 0;
matlabbatch{2}.spm.spatial.smooth.data(1) = cfg_dep('CAT12: Segmentation (current release): mwp1 Image', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','tiss', '()',{1}, '.','mwp', '()',{':'}));
matlabbatch{2}.spm.spatial.smooth.fwhm = [8 8 8];
matlabbatch{2}.spm.spatial.smooth.dtype = 0;
matlabbatch{2}.spm.spatial.smooth.im = 0;
matlabbatch{2}.spm.spatial.smooth.prefix = 's';
matlabbatch{3}.spm.tools.cat.tools.calcvol.data_xml(1) = cfg_dep('CAT12: Segmentation (current release): CAT Report', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','catxml', '()',{':'}));
matlabbatch{3}.spm.tools.cat.tools.calcvol.calcvol_TIV = 0;
matlabbatch{3}.spm.tools.cat.tools.calcvol.calcvol_name = 'TIV.txt';
spm('defaults', 'pet');
spm_jobman('run', matlabbatch);
disp('Done.');
end
